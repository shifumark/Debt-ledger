import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_manifest.freezed.dart';
part 'backup_manifest.g.dart';

@freezed
class BackupManifest with _$BackupManifest {
  const factory BackupManifest({
    required String appVersion,
    required int schemaVersion,
    required DateTime createdAt,
    required int debtorCount,
    required int transactionCount,
  }) = _BackupManifest;

  factory BackupManifest.fromJson(Map<String, dynamic> json) => _$BackupManifestFromJson(json);
}
