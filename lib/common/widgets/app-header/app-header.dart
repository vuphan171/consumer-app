import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Assets.images.svg.icArrowLeft.svg(width: 20.r, height: 20.r),
          onPressed: () => Navigator.pop(context),
        ),
        Text('Settings', style: theme.textTheme.displayLarge),
      ],
    );
  }
}
