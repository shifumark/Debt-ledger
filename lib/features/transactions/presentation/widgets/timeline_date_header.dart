import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';

class TimelineDateHeader extends StatelessWidget {
  const TimelineDateHeader({required this.date, super.key});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.xs, AppSpacing.md, AppSpacing.xs, AppSpacing.xs),
      child: Text(
        DateFormatter.relativeDayLabel(date),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
