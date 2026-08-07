// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$backupRepositoryHash() => r'71ca60ca6de99021d1950e8fd11671333dd6a20a';

/// Sync on purpose — constructing this must NOT force the database open.
/// [BackupRepositoryImpl] only resolves it lazily, and only for the backup
/// -creation methods; the restore flow closes the database first and must
/// never trigger a reopen before the file swap completes.
///
/// Copied from [backupRepository].
@ProviderFor(backupRepository)
final backupRepositoryProvider = AutoDisposeProvider<BackupRepository>.internal(
  backupRepository,
  name: r'backupRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$backupRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BackupRepositoryRef = AutoDisposeProviderRef<BackupRepository>;
String _$createBackupUseCaseHash() =>
    r'0b367be4817455e7ba5308e61ee65e4e2c8a9694';

/// See also [createBackupUseCase].
@ProviderFor(createBackupUseCase)
final createBackupUseCaseProvider = AutoDisposeProvider<CreateBackup>.internal(
  createBackupUseCase,
  name: r'createBackupUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createBackupUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CreateBackupUseCaseRef = AutoDisposeProviderRef<CreateBackup>;
String _$prepareRestoreUseCaseHash() =>
    r'79147a212fe1089ac0c0eab7fe42c826dd1b7f49';

/// See also [prepareRestoreUseCase].
@ProviderFor(prepareRestoreUseCase)
final prepareRestoreUseCaseProvider =
    AutoDisposeProvider<PrepareRestore>.internal(
      prepareRestoreUseCase,
      name: r'prepareRestoreUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$prepareRestoreUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PrepareRestoreUseCaseRef = AutoDisposeProviderRef<PrepareRestore>;
String _$applyRestoreUseCaseHash() =>
    r'df70fc7d15aa984f018be0c9be2e16e62bdc28f7';

/// See also [applyRestoreUseCase].
@ProviderFor(applyRestoreUseCase)
final applyRestoreUseCaseProvider = AutoDisposeProvider<ApplyRestore>.internal(
  applyRestoreUseCase,
  name: r'applyRestoreUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$applyRestoreUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApplyRestoreUseCaseRef = AutoDisposeProviderRef<ApplyRestore>;
String _$autoBackupCheckHash() => r'6a92090a2b2776d37e2ec1351dd4180f791a426b';

/// Fire-and-forget startup check: if automatic backup is enabled and due,
/// silently writes an internal backup and prunes old ones. Triggered once by
/// being watched (and its value ignored) from [DebtLedgerApp].
///
/// Copied from [autoBackupCheck].
@ProviderFor(autoBackupCheck)
final autoBackupCheckProvider = AutoDisposeFutureProvider<void>.internal(
  autoBackupCheck,
  name: r'autoBackupCheckProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$autoBackupCheckHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AutoBackupCheckRef = AutoDisposeFutureProviderRef<void>;
String _$autoBackupFrequencySettingHash() =>
    r'98f3df66e976e708f577b50aff45f30253802265';

/// See also [AutoBackupFrequencySetting].
@ProviderFor(AutoBackupFrequencySetting)
final autoBackupFrequencySettingProvider =
    AsyncNotifierProvider<
      AutoBackupFrequencySetting,
      AutoBackupFrequency
    >.internal(
      AutoBackupFrequencySetting.new,
      name: r'autoBackupFrequencySettingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$autoBackupFrequencySettingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AutoBackupFrequencySetting = AsyncNotifier<AutoBackupFrequency>;
String _$backupControllerHash() => r'f74a0e386da7a7e7db72dfdae8826535951d33de';

/// See also [BackupController].
@ProviderFor(BackupController)
final backupControllerProvider =
    AutoDisposeNotifierProvider<BackupController, BackupUiState>.internal(
      BackupController.new,
      name: r'backupControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$backupControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BackupController = AutoDisposeNotifier<BackupUiState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
