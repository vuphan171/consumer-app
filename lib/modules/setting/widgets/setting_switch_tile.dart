import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingSwitchTile extends StatelessWidget {
  final String title;
  final String desc;
  final bool checked;

  const SettingSwitchTile({
    super.key,
    required this.title,
    required this.desc,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    desc,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: CupertinoSwitch(
                value: checked,
                onChanged: (bool value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
