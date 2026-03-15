import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/modules/home/widgets/spending-overview/spending-category-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpendingOverview extends StatelessWidget {
  const SpendingOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Spending overview",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Details',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 16.w,
          ).copyWith(bottom: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Column(
            children: [
              SpendingCategoryItem(
                title: 'Housing',
                amount: '1,200 / 1,500',
                progress: 0.8,
                progressColor: Color(0xFF1E478A),
              ),
              SizedBox(height: 16.h),
              SpendingCategoryItem(
                title: 'Food',
                amount: '600 / 1000',
                progress: 0.6,
                progressColor: Color(0xFFF97316),
              ),
              SizedBox(height: 16.h),
              SpendingCategoryItem(
                title: 'Transport',
                amount: '300 / 500',
                progress: 0.6,
                progressColor: Color(0xFF22C55E),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
