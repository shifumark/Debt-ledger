import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../providers/settings_providers.dart';

class AppearanceSettingsScreen extends ConsumerWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(appThemeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Appearance')),
      body: AppScaffold(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: themeModeAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (e, _) => Text('$e'),
            data: (current) => RadioGroup<ThemeMode>(
              groupValue: current,
              onChanged: (value) {
                if (value != null) {
                  ref.read(appThemeModeProvider.notifier).setThemeMode(value);
                }
              },
              child: Column(
                children: ThemeMode.values.map((mode) {
                  return RadioListTile<ThemeMode>(
                    title: Text(_label(mode)),
                    value: mode,
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _label(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
}
