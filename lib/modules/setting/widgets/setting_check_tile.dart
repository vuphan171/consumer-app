import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingCheckTile extends StatelessWidget {
  final String title;
  final bool checked;
  final VoidCallback? onTap;

  const SettingCheckTile({
    super.key,
    required this.title,
    required this.checked,
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
                if (checked)
                  SizedBox(
                    width: 18.r,
                    height: 18.r,
                    child: Assets.images.svg.icChecked.svg(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
