import 'package:consumer_app/modules/home/widgets/balance-card.dart';
import 'package:consumer_app/modules/home/widgets/recent-transactions.dart';
import 'package:consumer_app/modules/home/widgets/spending-overview/spending-overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/home-header.dart' show HomeHeader;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: 24.h),
            BalanceCard(),
            SizedBox(height: 24.h),
            SpendingOverview(),
            SizedBox(height: 24.h),
            RecentTransactions(),
          ],
        ),
      ),
    );
  }
}
