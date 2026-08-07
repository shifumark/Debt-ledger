import 'package:flutter/widgets.dart';

/// Watches app lifecycle transitions and invokes [onShouldLock] when the app
/// is resumed after having been backgrounded longer than [autoLockDuration].
/// A fresh cold start is handled separately by the auth boot check, not by
/// this observer (there is no "backgrounded at" timestamp on cold start).
class AutoLockService with WidgetsBindingObserver {
  AutoLockService({
    required this.getAutoLockDuration,
    required this.onShouldLock,
  });

  final Duration Function() getAutoLockDuration;
  final VoidCallback onShouldLock;

  DateTime? _backgroundedAt;

  void start() => WidgetsBinding.instance.addObserver(this);

  void stop() => WidgetsBinding.instance.removeObserver(this);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        _backgroundedAt ??= DateTime.now();
      case AppLifecycleState.resumed:
        final backgroundedAt = _backgroundedAt;
        _backgroundedAt = null;
        if (backgroundedAt == null) return;
        final elapsed = DateTime.now().difference(backgroundedAt);
        final threshold = getAutoLockDuration();
        if (elapsed >= threshold) {
          onShouldLock();
        }
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }
}
