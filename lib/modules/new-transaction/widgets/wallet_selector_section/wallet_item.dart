import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletItem extends ConsumerWidget {
  final String payment;
  const WalletItem({super.key, required this.payment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AdaptiveTheme.of(context).theme;
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(8.r),
      ),
      width: 60.w,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Center(child: Text(payment, style: theme.textTheme.bodyMedium)),
    );
  }
}
