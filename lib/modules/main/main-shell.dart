import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/modules/main/widgets/tab_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../resources/custom_color.dart';

class MainShell extends StatelessWidget {
  final StatefulNavigationShell shell;

  const MainShell({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(child: shell),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ).copyWith(bottom: 24.h, top: 6.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: theme.extension<CustomColors>()!.cardShadow!,
                    offset: Offset(0, -4),
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabBarButton(
                    title: "Home",
                    active: true,
                    icon: Icon(
                      size: 24.r,
                      Icons.home,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  TabBarButton(
                    title: "Account",
                    active: false,
                    icon: Icon(
                      size: 24.r,
                      Icons.wallet,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Container(
                    width: 44.r,
                    height: 44.r,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(44.r),
                    ),
                    child: Center(
                      child: Icon(
                        size: 28.r,
                        Icons.add,
                        color: theme.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                  TabBarButton(
                    title: "Analytics",
                    active: false,
                    icon: Icon(
                      size: 24.r,
                      Icons.trending_up_outlined,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  TabBarButton(
                    title: "Profile",
                    active: false,
                    icon: Icon(
                      size: 24.r,
                      Icons.account_circle,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
