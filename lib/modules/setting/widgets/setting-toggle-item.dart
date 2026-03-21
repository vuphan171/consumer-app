import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingToggleItem extends StatelessWidget {
  final String title;
  final bool value;

  const SettingToggleItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outline, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          FlutterSwitch(
            value: false,
            onToggle: (val) {},
            width: 44.w,
            height: 24.h,
            activeColor: theme.colorScheme.primary,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
