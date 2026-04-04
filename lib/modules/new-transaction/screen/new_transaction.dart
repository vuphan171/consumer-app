import 'package:consumer_app/common/extension/extensions.dart';
import 'package:consumer_app/common/widgets/app-header/app-header.dart';
import 'package:consumer_app/common/widgets/app_button.dart';
import 'package:consumer_app/modules/new-transaction/widgets/amount_input_section/amount_input_section.dart';
import 'package:consumer_app/modules/new-transaction/widgets/category_selector_section/category_selector.dart';
import 'package:consumer_app/modules/new-transaction/widgets/datetime_picker_section.dart';
import 'package:consumer_app/modules/new-transaction/widgets/note_input_section.dart';
import 'package:consumer_app/modules/new-transaction/widgets/recurring_expense.dart';
import 'package:consumer_app/modules/new-transaction/widgets/transaction_type_segment.dart';
import 'package:consumer_app/modules/new-transaction/widgets/wallet_selector_section/wallet_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewTransactionScreen extends ConsumerStatefulWidget {
  const NewTransactionScreen({super.key});

  @override
  ConsumerState<NewTransactionScreen> createState() =>
      NewTransactionScreenState();
}

class NewTransactionScreenState extends ConsumerState<NewTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unFocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0.h),
            child: AppButton(
              state: ButtonState.active,
              onPressed: () {},
              text: 'Save Expense',
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: 'Transaction'),
              SizedBox(height: 12.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TransactionTypeSegment(),
                        SizedBox(height: 16.h),
                        AmountInputSection(),
                        SizedBox(height: 16.h),
                        CategorySelector(),
                        SizedBox(height: 16.h),
                        DateTimePickerSection(),
                        SizedBox(height: 16.h),
                        WalletSelector(),
                        SizedBox(height: 16.h),
                        RecurringExpense(),
                        SizedBox(height: 16.h),
                        NoteInputSection(),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
