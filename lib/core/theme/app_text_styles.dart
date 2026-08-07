import 'package:flutter/material.dart';

/// Semantic text style accessors layered on top of the Material 3 [TextTheme]
/// so screens never hardcode font sizes/weights directly.
extension AppTextStyles on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;

  TextStyle? get displayAmount => textStyles.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle? get cardTitle => textStyles.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get cardSubtitle => textStyles.bodySmall?.copyWith(
        color: Theme.of(this).colorScheme.onSurfaceVariant,
      );

  TextStyle? get sectionLabel => textStyles.labelLarge?.copyWith(
        color: Theme.of(this).colorScheme.onSurfaceVariant,
        letterSpacing: 0.5,
      );
}
