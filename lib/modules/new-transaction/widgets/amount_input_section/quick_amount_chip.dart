import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickAmountChip extends ConsumerWidget {
  final num amount;
  const QuickAmountChip({super.key, required this.amount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AdaptiveTheme.of(context).theme;
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(8.r),
      ),
      width: 60.w,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Center(
        child: Text(amount.toString(), style: theme.textTheme.bodyMedium),
      ),
    );
  }
}
