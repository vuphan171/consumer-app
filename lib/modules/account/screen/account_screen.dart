import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/modules/main/widgets/account_card.dart';
import 'package:consumer_app/modules/main/widgets/account_summary.dart';
import 'package:consumer_app/modules/main/widgets/account_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account', style: theme.textTheme.displayMedium),
            SizedBox(height: 16.h),
            AccountCard(),
            SizedBox(height: 24.h),
            AccountSummary(),
            SizedBox(height: 24.h),
            AccountTransactions(),
          ],
        ),
      ),
    );
  }
}
