import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_state.dart';
import '../providers/auth_providers.dart';
import '../providers/auto_lock_provider.dart';
import 'setup_wizard_screen.dart';
import 'unlock_screen.dart';

/// Sits above the router in the widget tree ([MaterialApp.router]'s
/// `builder`) and overlays the setup/unlock flow on top of whatever route is
/// current whenever the app isn't unlocked — the underlying route is
/// preserved so unlocking returns the user to where they were.
class LockWrapper extends ConsumerWidget {
  const LockWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(autoLockProvider);
    final authState = ref.watch(authControllerProvider);

    return Stack(
      children: [
        child,
        if (authState.status == AuthStatus.needsSetup) const SetupWizardScreen(),
        if (authState.status == AuthStatus.locked) const UnlockScreen(),
      ],
    );
  }
}
