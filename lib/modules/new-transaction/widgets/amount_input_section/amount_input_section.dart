import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/modules/new-transaction/widgets/amount_input_section/quick_amount_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<num> quickAmountOptions = [10, 20, 50, 100, 200, 300, 500];

class AmountInputSection extends ConsumerWidget {
  const AmountInputSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AdaptiveTheme.of(context).theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Amount', style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.h),
        TextField(
          keyboardType: TextInputType.number,
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            hintText: "0",
            filled: true,
            fillColor: theme.colorScheme.outlineVariant,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none, // bỏ viền
            ),
          ),
        ),
        SizedBox(height: 8.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: quickAmountOptions.map((amount) {
              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: QuickAmountChip(amount: amount),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
