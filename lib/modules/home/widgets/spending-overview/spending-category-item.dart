import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpendingCategoryItem extends StatelessWidget {
  final String title;
  final String amount;
  final double progress;
  final Color progressColor;

  const SpendingCategoryItem({
    super.key,
    required this.title,
    required this.amount,
    required this.progress,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              amount,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: const Color(0xFFF3F4F6),
          minHeight: 8.h,
          borderRadius: BorderRadius.circular(8.r),
          valueColor: AlwaysStoppedAnimation(progressColor),
        ),
      ],
    );
  }
}
