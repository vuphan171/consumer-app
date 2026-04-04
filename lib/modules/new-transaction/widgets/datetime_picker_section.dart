import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimePickerSection extends ConsumerWidget {
  const DateTimePickerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AdaptiveTheme.of(context).theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date', style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.h),
        GestureDetector(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select date',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Icon(
                  Icons.calendar_month,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
