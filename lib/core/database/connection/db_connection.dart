import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';

import '../../constants/db_constants.dart';

/// Must be a top-level/static function: it is sent to the background
/// isolate that Drift spins up for the native database connection.
void _overrideSqlCipherForCurrentPlatform() {
  if (Platform.isAndroid) {
    open.overrideFor(OperatingSystem.android, openCipherOnAndroid);
  }
  // iOS/macOS: sqlcipher_flutter_libs links the SQLCipher-enabled sqlite3
  // build directly, no runtime override needed.
}

/// Opens (creating if needed) the SQLCipher-encrypted app database file.
/// [passphrase] must be a high-entropy secret sourced from secure storage —
/// never derived directly from the user's PIN (see DbKeyManager).
QueryExecutor openEncryptedConnection(String passphrase) {
  return LazyDatabase(() async {
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlCipherOnOldAndroidVersions();
    }
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, DbConstants.dbFileName));

    return NativeDatabase.createInBackground(
      file,
      isolateSetup: _overrideSqlCipherForCurrentPlatform,
      setup: (rawDb) {
        rawDb.execute("PRAGMA key = '$passphrase';");
        rawDb.execute('PRAGMA cipher_page_size = 4096;');
        rawDb.execute('PRAGMA foreign_keys = ON;');
      },
    );
  });
}
