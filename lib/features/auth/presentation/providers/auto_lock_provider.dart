import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/security/auto_lock_service.dart';
import 'auth_providers.dart';

part 'auto_lock_provider.g.dart';

@riverpod
Future<Duration> autoLockDuration(Ref ref) =>
    ref.watch(authRepositoryProvider).getAutoLockDuration();

@Riverpod(keepAlive: true)
class AutoLock extends _$AutoLock {
  AutoLockService? _service;
  Duration _cachedDuration = const Duration(seconds: 60);

  @override
  void build() {
    _service = AutoLockService(
      getAutoLockDuration: () => _cachedDuration,
      onShouldLock: () => ref.read(authControllerProvider.notifier).lock(),
    )..start();

    ref.listen(autoLockDurationProvider, (_, next) {
      next.whenData((value) => _cachedDuration = value);
    }, fireImmediately: true);

    ref.onDispose(() => _service?.stop());
  }
}
