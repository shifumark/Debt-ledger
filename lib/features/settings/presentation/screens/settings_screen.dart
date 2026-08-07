import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: AppScaffold(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          children: [
            SettingsTile(
              icon: Icons.lock_outline,
              title: 'Security',
              subtitle: 'PIN, password, biometrics, auto-lock',
              onTap: () => context.push(AppRoutes.settingsSecurity),
            ),
            SettingsTile(
              icon: Icons.palette_outlined,
              title: 'Appearance',
              subtitle: 'Theme',
              onTap: () => context.push(AppRoutes.settingsAppearance),
            ),
            SettingsTile(
              icon: Icons.backup_outlined,
              title: 'Backup & restore',
              subtitle: 'Local encrypted backup, restore, and auto-backup',
              onTap: () => context.push(AppRoutes.settingsBackup),
            ),
            const SettingsTile(
              icon: Icons.ios_share_outlined,
              title: 'Export',
              subtitle: 'Use Reports to export data as PDF, Excel, or CSV',
            ),
          ],
        ),
      ),
    );
  }
}
