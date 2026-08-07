import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:debt_ledger/core/constants/db_constants.dart';
import 'package:debt_ledger/core/security/db_key_manager.dart';
import 'package:debt_ledger/core/security/secure_storage_service.dart';
import 'package:debt_ledger/features/backup/data/backup_repository_impl.dart';
import 'package:debt_ledger/features/backup/domain/entities/backup_manifest.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// prepareRestore/applyRestore never touch the database (see the "lazy
/// _getDatabase" comment in BackupRepositoryImpl), so these tests exercise
/// them directly without a real SQLCipher connection — a getter that throws
/// if called is a deliberate tripwire confirming that invariant holds.
Future<T> _neverCallDatabase<T>() =>
    throw StateError('restore-only operations must never open the database');

BackupRepositoryImpl _buildRepository() {
  final dbKeyManager = DbKeyManager(SecureStorageService(const FlutterSecureStorage()));
  return BackupRepositoryImpl(_neverCallDatabase, dbKeyManager);
}

Future<File> _writeZip(Directory dir, String name, Map<String, List<int>> entries) async {
  final archive = Archive();
  entries.forEach((path, bytes) {
    archive.addFile(ArchiveFile(path, bytes.length, bytes));
  });
  final bytes = ZipEncoder().encode(archive)!;
  final file = File('${dir.path}/$name');
  await file.writeAsBytes(bytes);
  return file;
}

class _FakePathProviderPlatform extends PathProviderPlatform {
  _FakePathProviderPlatform(this._path);
  final String _path;

  @override
  Future<String?> getTemporaryPath() async => _path;

  @override
  Future<String?> getApplicationDocumentsPath() async => _path;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('backup_test_');
    PathProviderPlatform.instance = _FakePathProviderPlatform(tempDir.path);
  });

  tearDown(() async {
    if (tempDir.existsSync()) await tempDir.delete(recursive: true);
  });

  test('prepareRestore succeeds for a well-formed backup zip', () async {
    final manifest = BackupManifest(
      appVersion: '1.0.0',
      schemaVersion: DbConstants.schemaVersion,
      createdAt: DateTime(2026, 1, 1),
      debtorCount: 3,
      transactionCount: 10,
    );
    final zip = await _writeZip(tempDir, 'valid.zip', {
      'manifest.json': utf8.encode(jsonEncode(manifest.toJson())),
      'debt_ledger_backup.db': [1, 2, 3, 4],
    });

    final repo = _buildRepository();
    final result = await repo.prepareRestore(zip);

    final pending = result.fold((f) => throw StateError(f.toString()), (p) => p);
    expect(pending.manifest.debtorCount, 3);
    expect(pending.manifest.transactionCount, 10);
    expect(File('${pending.extractedDir.path}/debt_ledger_backup.db').existsSync(), isTrue);

    await repo.cleanupPendingRestore(pending);
    expect(pending.extractedDir.existsSync(), isFalse);
  });

  test('prepareRestore rejects a zip with no manifest', () async {
    final zip = await _writeZip(tempDir, 'no_manifest.zip', {
      'debt_ledger_backup.db': [1, 2, 3],
    });

    final repo = _buildRepository();
    final result = await repo.prepareRestore(zip);

    expect(result.fold((f) => true, (_) => false), isTrue);
  });

  test('prepareRestore rejects a zip with no database file', () async {
    final manifest = BackupManifest(
      appVersion: '1.0.0',
      schemaVersion: DbConstants.schemaVersion,
      createdAt: DateTime(2026, 1, 1),
      debtorCount: 0,
      transactionCount: 0,
    );
    final zip = await _writeZip(tempDir, 'no_db.zip', {
      'manifest.json': utf8.encode(jsonEncode(manifest.toJson())),
    });

    final repo = _buildRepository();
    final result = await repo.prepareRestore(zip);

    expect(result.fold((f) => true, (_) => false), isTrue);
  });

  test('prepareRestore rejects a backup from an incompatible schema version', () async {
    final manifest = BackupManifest(
      appVersion: '1.0.0',
      schemaVersion: DbConstants.schemaVersion + 1,
      createdAt: DateTime(2026, 1, 1),
      debtorCount: 0,
      transactionCount: 0,
    );
    final zip = await _writeZip(tempDir, 'wrong_schema.zip', {
      'manifest.json': utf8.encode(jsonEncode(manifest.toJson())),
      'debt_ledger_backup.db': [1],
    });

    final repo = _buildRepository();
    final result = await repo.prepareRestore(zip);

    expect(result.fold((f) => true, (_) => false), isTrue);
  });
}
