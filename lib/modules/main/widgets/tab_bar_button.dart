import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class TabBarButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool active;

  const TabBarButton({
    required this.title,
    required this.icon,
    required this.active,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return Container(
      padding: EdgeInsets.only(top: 6.h),
      child: Column(
        children: [
          icon,
          SizedBox(height: 4.h),
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: active
                  ? theme.colorScheme.secondary
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
