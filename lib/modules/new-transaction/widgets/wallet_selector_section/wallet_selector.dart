import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/modules/new-transaction/widgets/wallet_selector_section/wallet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<String> paymentMethods = ["Cash", "Card", "Bank", "Digital"];

class WalletSelector extends ConsumerWidget {
  const WalletSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AdaptiveTheme.of(context).theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment method', style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: paymentMethods.map((payment) {
              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: WalletItem(payment: payment),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
