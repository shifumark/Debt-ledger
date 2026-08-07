import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../auth/presentation/providers/auto_lock_provider.dart';
import '../widgets/settings_tile.dart';

const _autoLockOptions = <Duration>[
  Duration(seconds: 0),
  Duration(seconds: 60),
  Duration(minutes: 5),
  Duration(minutes: 15),
];

String _autoLockLabel(Duration d) {
  if (d == Duration.zero) return 'Immediately';
  if (d.inMinutes < 1) return '${d.inSeconds}s';
  return '${d.inMinutes} min';
}

class SecuritySettingsScreen extends ConsumerWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final autoLockAsync = ref.watch(autoLockDurationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Security')),
      body: AppScaffold(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          children: [
            SettingsTile(
              icon: Icons.pin_outlined,
              title: 'Change PIN',
              onTap: () => _showChangePinSheet(context, ref),
            ),
            SettingsTile(
              icon: Icons.fingerprint,
              title: 'Biometric unlock',
              trailing: Switch(
                value: authState.biometricEnabled,
                onChanged: (enabled) async {
                  await ref.read(enableBiometricUseCaseProvider).call(enable: enabled);
                  await ref.read(authControllerProvider.notifier).refresh();
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.sm),
              child: Text('Auto-lock after', style: Theme.of(context).textTheme.titleSmall),
            ),
            autoLockAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (e, _) => Text('$e'),
              data: (current) => RadioGroup<Duration>(
                groupValue: current,
                onChanged: (value) async {
                  if (value == null) return;
                  await ref.read(setAutoLockDurationUseCaseProvider).call(value);
                  ref.invalidate(autoLockDurationProvider);
                },
                child: Column(
                  children: _autoLockOptions.map((duration) {
                    return RadioListTile<Duration>(
                      title: Text(_autoLockLabel(duration)),
                      value: duration,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showChangePinSheet(BuildContext context, WidgetRef ref) async {
    final currentController = TextEditingController();
    final newController = TextEditingController();
    final confirmController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    String? error;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => StatefulBuilder(
        builder: (sheetContext, setState) {
          return Padding(
            padding: EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              top: AppSpacing.lg,
              bottom: MediaQuery.of(sheetContext).viewInsets.bottom + AppSpacing.lg,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Change PIN', style: Theme.of(sheetContext).textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.md),
                  TextFormField(
                    controller: currentController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Current PIN'),
                    validator: Validators.pin,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  TextFormField(
                    controller: newController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'New PIN'),
                    validator: Validators.pin,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  TextFormField(
                    controller: confirmController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Confirm new PIN'),
                    validator: Validators.pin,
                  ),
                  if (error != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(error!, style: TextStyle(color: Theme.of(sheetContext).colorScheme.error)),
                  ],
                  const SizedBox(height: AppSpacing.lg),
                  FilledButton(
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;
                      if (newController.text != confirmController.text) {
                        setState(() => error = 'New PINs do not match');
                        return;
                      }
                      final verifyResult =
                          await ref.read(verifyPinUseCaseProvider).call(currentController.text);
                      final isValid = verifyResult.fold((_) => false, (valid) => valid);
                      if (!isValid) {
                        setState(() => error = 'Current PIN is incorrect');
                        return;
                      }
                      await ref.read(setupPinUseCaseProvider).call(newController.text);
                      if (sheetContext.mounted) Navigator.of(sheetContext).pop();
                    },
                    child: const Text('Update PIN'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
