import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/confirm_dialog.dart';
import '../providers/backup_providers.dart';

class BackupSettingsScreen extends ConsumerStatefulWidget {
  const BackupSettingsScreen({super.key});

  @override
  ConsumerState<BackupSettingsScreen> createState() => _BackupSettingsScreenState();
}

class _BackupSettingsScreenState extends ConsumerState<BackupSettingsScreen> {
  Future<void> _createBackup() async {
    final file = await ref.read(backupControllerProvider.notifier).createAndReturnBackup();
    if (!mounted) return;
    if (file == null) {
      _showError();
      return;
    }
    await Share.shareXFiles([XFile(file.path)], subject: 'Debt Ledger Backup');
  }

  Future<void> _pickAndRestore() async {
    final picked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );
    final path = picked?.files.single.path;
    if (path == null) return;
    if (!mounted) return;

    await ref.read(backupControllerProvider.notifier).pickAndPrepareRestore(File(path));
    if (!mounted) return;

    final uiState = ref.read(backupControllerProvider);
    if (uiState.errorMessage != null) {
      _showError();
      return;
    }
    final pending = uiState.pendingRestore;
    if (pending == null) return;

    final manifest = pending.manifest;
    final confirmed = await showConfirmDialog(
      context,
      title: 'Restore this backup?',
      message: 'Backup from ${DateFormatter.dateTime(manifest.createdAt)}\n'
          '${manifest.debtorCount} debtors, ${manifest.transactionCount} transactions.\n\n'
          'This replaces ALL current data on this device and cannot be undone.',
      confirmLabel: 'Restore',
      destructive: true,
    );

    if (!confirmed) {
      await ref.read(backupControllerProvider.notifier).cancelRestore();
      return;
    }

    final success = await ref.read(backupControllerProvider.notifier).confirmRestore();
    if (!mounted) return;
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Backup restored successfully.')),
      );
    } else {
      _showError();
    }
  }

  void _showError() {
    final message = ref.read(backupControllerProvider).errorMessage ?? 'Something went wrong.';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(backupControllerProvider);
    final frequencyAsync = ref.watch(autoBackupFrequencySettingProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Backup & Restore')),
      body: AppScaffold(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.backup_outlined),
                title: const Text('Create backup'),
                subtitle: const Text('Save an encrypted copy of your ledger and share it'),
                trailing: uiState.isBusy
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.chevron_right),
                onTap: uiState.isBusy ? null : _createBackup,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Card(
              child: ListTile(
                leading: const Icon(Icons.restore_outlined),
                title: const Text('Restore from backup'),
                subtitle: const Text('Replace current data with a backup file'),
                trailing: uiState.isBusy
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.chevron_right),
                onTap: uiState.isBusy ? null : _pickAndRestore,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: Text('Automatic backup', style: Theme.of(context).textTheme.titleSmall),
            ),
            const SizedBox(height: AppSpacing.sm),
            frequencyAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (e, _) => Text('$e'),
              data: (current) => Card(
                child: RadioGroup<AutoBackupFrequency>(
                  groupValue: current,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(autoBackupFrequencySettingProvider.notifier).setFrequency(value);
                    }
                  },
                  child: Column(
                    children: AutoBackupFrequency.values.map((frequency) {
                      return RadioListTile<AutoBackupFrequency>(
                        title: Text(_frequencyLabel(frequency)),
                        value: frequency,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: Text(
                'Automatic backups are saved privately on this device only (not shared or uploaded). Use "Create backup" above to save a copy to a cloud drive or another device.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _frequencyLabel(AutoBackupFrequency frequency) {
    switch (frequency) {
      case AutoBackupFrequency.off:
        return 'Off';
      case AutoBackupFrequency.daily:
        return 'Daily';
      case AutoBackupFrequency.weekly:
        return 'Weekly';
    }
  }
}
