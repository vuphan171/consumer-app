import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/common/extension/transaction.dart';
import 'package:consumer_app/modules/new-transaction/provider/new_transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:segmented_button_slide/segmented_button_slide.dart';

class TransactionTypeSegment extends ConsumerWidget {
  const TransactionTypeSegment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AdaptiveTheme.of(context).theme;
    final state = ref.watch(newTransactionProvider);

    return SegmentedButtonSlide(
      entries: const [
        SegmentedButtonSlideEntry(label: "Income"),
        SegmentedButtonSlideEntry(label: "Expense"),
        SegmentedButtonSlideEntry(label: "Transfer"),
      ],
      selectedEntry: state.transactionType.toValue(),
      onChange: (selected) => {
        ref
            .read(newTransactionProvider.notifier)
            .onChangeTransactionType(selected),
      },
      colors: SegmentedButtonSlideColors(
        barColor: theme.colorScheme.outlineVariant,
        backgroundSelectedColor: theme.colorScheme.inverseSurface,
      ),
      height: 36.h,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      borderRadius: BorderRadius.circular(8.r),
      selectedTextStyle: theme.textTheme.titleMedium?.copyWith(
        color: theme.colorScheme.onInverseSurface,
      ),
      unselectedTextStyle: theme.textTheme.titleMedium?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}
