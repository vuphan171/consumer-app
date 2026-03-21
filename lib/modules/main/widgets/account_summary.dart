import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSummary extends StatelessWidget {
  const AccountSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryItem(
            title: 'Income',
            amount: 0,
            percent: 0,
            isIncrease: true,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _SummaryItem(
            title: 'Expense',
            amount: 0,
            percent: 0,
            isIncrease: false,
          ),
        ),
      ],
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final double amount;
  final double percent;
  final bool isIncrease;

  const _SummaryItem({
    required this.title,
    required this.amount,
    required this.percent,
    required this.isIncrease,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    final color = isIncrease ? Colors.green : Colors.red;
    final icon = isIncrease ? Icons.arrow_upward : Icons.arrow_downward;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: amount.toStringAsFixed(2),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyMedium?.color,
                ),
              ),
              WidgetSpan(child: SizedBox(width: 6.w)),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(icon, size: 14, color: color),
              ),
              WidgetSpan(child: SizedBox(width: 2.w)),
              TextSpan(
                text: '${percent.toStringAsFixed(2)}%',
                style: theme.textTheme.bodyMedium?.copyWith(color: color),
              ),
            ],
          ),
        ),
        Text(
          'Compared to last month',
          style: theme.textTheme.labelMedium?.copyWith(color: color),
        ),
      ],
    );
  }
}
