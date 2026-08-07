import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/providers/core_providers.dart';

part 'settings_providers.g.dart';

@Riverpod(keepAlive: true)
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<ThemeMode> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    final raw = prefs.getString(AppConstants.prefsThemeModeKey);
    return ThemeMode.values.firstWhere(
      (m) => m.name == raw,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setString(AppConstants.prefsThemeModeKey, mode.name);
    state = AsyncData(mode);
  }
}

@Riverpod(keepAlive: true)
class CurrencyCode extends _$CurrencyCode {
  @override
  Future<String> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    return prefs.getString(AppConstants.prefsCurrencyCodeKey) ?? 'USD';
  }

  Future<void> setCurrencyCode(String code) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setString(AppConstants.prefsCurrencyCodeKey, code);
    state = AsyncData(code);
  }
}
