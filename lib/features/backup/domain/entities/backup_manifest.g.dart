// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_manifest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackupManifestImpl _$$BackupManifestImplFromJson(Map<String, dynamic> json) =>
    _$BackupManifestImpl(
      appVersion: json['appVersion'] as String,
      schemaVersion: (json['schemaVersion'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      debtorCount: (json['debtorCount'] as num).toInt(),
      transactionCount: (json['transactionCount'] as num).toInt(),
    );

Map<String, dynamic> _$$BackupManifestImplToJson(
  _$BackupManifestImpl instance,
) => <String, dynamic>{
  'appVersion': instance.appVersion,
  'schemaVersion': instance.schemaVersion,
  'createdAt': instance.createdAt.toIso8601String(),
  'debtorCount': instance.debtorCount,
  'transactionCount': instance.transactionCount,
};
