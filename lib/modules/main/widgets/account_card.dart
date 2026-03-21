import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Color(0xFFffdad5),
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: Color(0xFF73342c), width: 1.5),
      ),
      height: 175.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bank',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Color(0xFF73342c),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Vu',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Color(0xFF73342c),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Container(width: 40.r, height: 40.r, color: Colors.red),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Balance',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Color(0xFF77574e),
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '0',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: Color(0xFF73342c),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
