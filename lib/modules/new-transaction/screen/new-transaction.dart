import 'package:consumer_app/common/extension/transaction.dart';
import 'package:consumer_app/common/widgets/app-header/app-header.dart';
import 'package:consumer_app/modules/new-transaction/provider/new_transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:segmented_button_slide/segmented_button_slide.dart';

class NewTransactionScreen extends ConsumerStatefulWidget {
  const NewTransactionScreen({super.key});

  @override
  ConsumerState<NewTransactionScreen> createState() =>
      NewTransactionScreenState();
}

class NewTransactionScreenState extends ConsumerState<NewTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    final state = ref.watch(newTransactionProvider);

    return Column(
      children: [
        AppHeader(title: 'Transaction'),
        SizedBox(height: 12.h),
        SegmentedButtonSlide(
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
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.all(4.r),
          borderRadius: BorderRadius.circular(40.r),
          selectedTextStyle: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onInverseSurface,
          ),
          unselectedTextStyle: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
