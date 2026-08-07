import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../core/constants/db_constants.dart';
import '../../../core/database/app_database.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/error/result.dart';
import '../../../core/security/db_key_manager.dart';
import '../domain/entities/backup_manifest.dart';
import '../domain/entities/pending_restore.dart';
import '../domain/repositories/backup_repository.dart';

const _backupDbEntryName = 'debt_ledger_backup.db';
const _manifestEntryName = 'manifest.json';
const _photosEntryPrefix = 'debtor_photos/';

class BackupRepositoryImpl implements BackupRepository {
  BackupRepositoryImpl(this._getDatabase, this._dbKeyManager);

  /// Lazily resolved — restore operations never call this, so preparing or
  /// applying a restore never forces the (possibly just-closed, about-to-be
  /// -overwritten) database back open. Only backup creation needs it.
  final Future<AppDatabase> Function() _getDatabase;
  final DbKeyManager _dbKeyManager;

  @override
  Future<Result<File>> createBackup() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final zipFile = File(p.join(
        tempDir.path,
        'debt_ledger_backup_${DateTime.now().millisecondsSinceEpoch}.zip',
      ));
      await _buildBackupZip(zipFile);
      return resultSuccess(zipFile);
    } on Exception catch (e) {
      return resultFailure(Failure.database('Failed to create backup: $e'));
    }
  }

  @override
  Future<Result<File>> createInternalBackup() async {
    try {
      final backupsDir = await _internalBackupsDir();
      final zipFile = File(p.join(
        backupsDir.path,
        'auto_backup_${DateTime.now().millisecondsSinceEpoch}.zip',
      ));
      await _buildBackupZip(zipFile);
      return resultSuccess(zipFile);
    } on Exception catch (e) {
      return resultFailure(Failure.database('Failed to create automatic backup: $e'));
    }
  }

  @override
  Future<Result<PendingRestore>> prepareRestore(File backupZip) async {
    try {
      final bytes = await backupZip.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      final tempDir = await getTemporaryDirectory();
      final extractDir = Directory(p.join(
        tempDir.path,
        'restore_${DateTime.now().millisecondsSinceEpoch}',
      ));
      await extractDir.create(recursive: true);

      for (final entry in archive) {
        final outPath = p.join(extractDir.path, entry.name);
        if (entry.isFile) {
          final outFile = File(outPath);
          await outFile.parent.create(recursive: true);
          await outFile.writeAsBytes(entry.content as List<int>);
        } else {
          await Directory(outPath).create(recursive: true);
        }
      }

      final manifestFile = File(p.join(extractDir.path, _manifestEntryName));
      if (!manifestFile.existsSync()) {
        return resultFailure(const Failure.validation(
          'This file is not a valid Debt Ledger backup (missing manifest).',
        ));
      }
      final manifest = BackupManifest.fromJson(
        jsonDecode(await manifestFile.readAsString()) as Map<String, dynamic>,
      );

      if (manifest.schemaVersion != DbConstants.schemaVersion) {
        return resultFailure(Failure.validation(
          'This backup was made with an incompatible app version and cannot be restored.',
        ));
      }

      final backupDbFile = File(p.join(extractDir.path, _backupDbEntryName));
      if (!backupDbFile.existsSync()) {
        return resultFailure(const Failure.validation(
          'This file is not a valid Debt Ledger backup (missing database).',
        ));
      }

      return resultSuccess(PendingRestore(manifest: manifest, extractedDir: extractDir));
    } on Exception catch (e) {
      return resultFailure(Failure.validation('Could not read backup file: $e'));
    }
  }

  @override
  Future<Result<void>> applyRestore(PendingRestore pending) async {
    try {
      final docsDir = await getApplicationDocumentsDirectory();
      final liveDbFile = File(p.join(docsDir.path, DbConstants.dbFileName));
      final backupDbFile = File(p.join(pending.extractedDir.path, _backupDbEntryName));

      await backupDbFile.copy(liveDbFile.path);

      final livePhotosDir = Directory(p.join(docsDir.path, DbConstants.debtorPhotosDirName));
      final backupPhotosDir = Directory(p.join(pending.extractedDir.path, DbConstants.debtorPhotosDirName));
      if (backupPhotosDir.existsSync()) {
        if (livePhotosDir.existsSync()) {
          await livePhotosDir.delete(recursive: true);
        }
        await _copyDirectory(backupPhotosDir, livePhotosDir);
      }

      await cleanupPendingRestore(pending);
      return resultSuccess(null);
    } on Exception catch (e) {
      return resultFailure(Failure.database('Failed to apply restore: $e'));
    }
  }

  @override
  Future<void> cleanupPendingRestore(PendingRestore pending) async {
    if (pending.extractedDir.existsSync()) {
      await pending.extractedDir.delete(recursive: true);
    }
  }

  @override
  Future<void> pruneInternalBackups({int keep = 5}) async {
    final backupsDir = await _internalBackupsDir();
    if (!backupsDir.existsSync()) return;
    final files = backupsDir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.zip'))
        .toList()
      ..sort((a, b) => b.statSync().modified.compareTo(a.statSync().modified));
    for (final file in files.skip(keep)) {
      await file.delete();
    }
  }

  Future<void> _buildBackupZip(File destinationZip) async {
    final database = await _getDatabase();
    final passphrase = await _dbKeyManager.getOrCreatePassphrase();
    final tempDir = await getTemporaryDirectory();
    final stagingDbPath = p.join(
      tempDir.path,
      'export_${DateTime.now().millisecondsSinceEpoch}.db',
    );
    final stagingDbFile = File(stagingDbPath);
    if (stagingDbFile.existsSync()) await stagingDbFile.delete();

    await database.customStatement(
      "ATTACH DATABASE '${_escapeSql(stagingDbPath)}' AS backup_export KEY '${_escapeSql(passphrase)}';",
    );
    try {
      await database.customStatement("SELECT sqlcipher_export('backup_export');");
    } finally {
      await database.customStatement('DETACH DATABASE backup_export;');
    }

    if (!stagingDbFile.existsSync()) {
      throw const DatabaseException('sqlcipher_export did not produce a backup file');
    }

    final debtorCount = await _countRows(database, 'debtors');
    final transactionCount = await _countRows(database, 'transactions');
    final packageInfo = await PackageInfo.fromPlatform();

    final manifest = BackupManifest(
      appVersion: packageInfo.version,
      schemaVersion: DbConstants.schemaVersion,
      createdAt: DateTime.now(),
      debtorCount: debtorCount,
      transactionCount: transactionCount,
    );

    final archive = Archive();
    final dbBytes = await stagingDbFile.readAsBytes();
    archive.addFile(ArchiveFile(_backupDbEntryName, dbBytes.length, dbBytes));

    final manifestBytes = utf8.encode(jsonEncode(manifest.toJson()));
    archive.addFile(ArchiveFile(_manifestEntryName, manifestBytes.length, manifestBytes));

    final docsDir = await getApplicationDocumentsDirectory();
    final photosDir = Directory(p.join(docsDir.path, DbConstants.debtorPhotosDirName));
    if (photosDir.existsSync()) {
      for (final entity in photosDir.listSync(recursive: true)) {
        if (entity is File) {
          final relativePath = p.relative(entity.path, from: photosDir.path);
          final bytes = await entity.readAsBytes();
          archive.addFile(ArchiveFile(
            '$_photosEntryPrefix${relativePath.replaceAll('\\', '/')}',
            bytes.length,
            bytes,
          ));
        }
      }
    }

    final zipBytes = ZipEncoder().encode(archive);
    if (zipBytes == null) {
      throw const DatabaseException('Failed to encode backup archive');
    }
    await destinationZip.writeAsBytes(zipBytes);
    await stagingDbFile.delete();
  }

  Future<int> _countRows(AppDatabase database, String table) async {
    final row = await database.customSelect('SELECT COUNT(*) AS c FROM $table').getSingle();
    return row.read<int>('c');
  }

  Future<void> _copyDirectory(Directory source, Directory destination) async {
    await destination.create(recursive: true);
    for (final entity in source.listSync(recursive: false)) {
      if (entity is Directory) {
        await _copyDirectory(
          entity,
          Directory(p.join(destination.path, p.basename(entity.path))),
        );
      } else if (entity is File) {
        await entity.copy(p.join(destination.path, p.basename(entity.path)));
      }
    }
  }

  Future<Directory> _internalBackupsDir() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(docsDir.path, 'auto_backups'));
    if (!dir.existsSync()) await dir.create(recursive: true);
    return dir;
  }

  String _escapeSql(String value) => value.replaceAll("'", "''");
}
