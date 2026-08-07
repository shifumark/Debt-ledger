import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/lock_wrapper.dart';
import 'features/backup/presentation/providers/backup_providers.dart';
import 'features/settings/presentation/providers/settings_providers.dart';

class DebtLedgerApp extends ConsumerWidget {
  const DebtLedgerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(appThemeModeProvider).valueOrNull ?? ThemeMode.system;
    // Fire-and-forget: silently writes an internal backup if one is due.
    // Its AsyncValue is intentionally never rendered.
    ref.watch(autoBackupCheckProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) => LockWrapper(child: child ?? const SizedBox.shrink()),
    );
  }
}
