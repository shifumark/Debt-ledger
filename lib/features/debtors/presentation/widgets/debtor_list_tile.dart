import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/debtor.dart';
import 'debtor_avatar.dart';
import 'debtor_balance_badge.dart';

class DebtorListTile extends StatelessWidget {
  const DebtorListTile({
    required this.debtor,
    required this.balance,
    required this.onTap,
    super.key,
  });

  final Debtor debtor;
  final double balance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              DebtorAvatar(fullName: debtor.fullName, photoPath: debtor.photoPath),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      debtor.fullName,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (debtor.nickname != null && debtor.nickname!.isNotEmpty)
                      Text(
                        debtor.nickname!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              DebtorBalanceBadge(balance: balance),
            ],
          ),
        ),
      ),
    );
  }
}
