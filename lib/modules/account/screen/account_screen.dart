import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/modules/main/widgets/account_card.dart';
import 'package:consumer_app/modules/main/widgets/account_summary.dart';
import 'package:consumer_app/modules/main/widgets/account_transactions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final PageController _controller = PageController(viewportFraction: 1);

  int _currentIndex = 0;

  final List<int> accounts = List.generate(5, (index) => index);

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text('Account', style: theme.textTheme.displayMedium),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 180.h,
            child: PageView.builder(
              controller: _controller,
              itemCount: accounts.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: AccountCard(),
                );
              },
            ),
          ),
          SizedBox(height: 12.h),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: accounts.length,
              onDotClicked: (index) {
                _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              effect: WormEffect(
                dotHeight: 8.h,
                dotWidth: 8.w,
                spacing: 6.w,
                activeDotColor: theme.colorScheme.primary,
                dotColor: theme.colorScheme.onSurface.withOpacity(0.2),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AccountSummary(),
          ),

          SizedBox(height: 24.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AccountTransactions(),
          ),
        ],
      ),
    );
  }
}
