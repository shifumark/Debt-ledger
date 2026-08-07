import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/currency_formatter.dart';

/// Simple bar comparison of lent vs received vs outstanding — enough to
/// give an at-a-glance read of cash position without a full reports module.
class BalanceChart extends StatelessWidget {
  const BalanceChart({
    required this.totalLent,
    required this.totalReceived,
    required this.totalOutstanding,
    super.key,
  });

  final double totalLent;
  final double totalReceived;
  final double totalOutstanding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final values = [totalLent, totalReceived, totalOutstanding];
    final maxValue = values.fold<double>(1, (max, v) => v > max ? v : max);
    final colors = [colorScheme.error, colorScheme.primary, colorScheme.tertiary];
    final labels = ['Lent', 'Received', 'Outstanding'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: SizedBox(
          height: 180,
          child: BarChart(
            BarChartData(
              maxY: maxValue * 1.2,
              alignment: BarChartAlignment.spaceAround,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index < 0 || index >= labels.length) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(labels[index], style: Theme.of(context).textTheme.bodySmall),
                      );
                    },
                  ),
                ),
              ),
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
                    CurrencyFormatter.formatCompact(rod.toY),
                    const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              barGroups: List.generate(values.length, (i) {
                return BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: values[i],
                      color: colors[i],
                      width: 28,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
