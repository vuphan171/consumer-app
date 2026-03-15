import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingOptionTile extends StatelessWidget {
  final String title;
  final String? value;
  final VoidCallback? onTap;

  const SettingOptionTile({
    super.key,
    required this.title,
    this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (value != null) ...[
                  Text(
                    value!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(width: 4.w),
                ],
                SizedBox(
                  width: 14.r,
                  height: 14.r,
                  child: Assets.images.svg.icChevronNext.svg(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
