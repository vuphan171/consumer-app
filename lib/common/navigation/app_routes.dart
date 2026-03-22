import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:consumer_app/common/navigation/route_paths.dart';
import 'package:consumer_app/modules/account/screen/account_screen.dart';
import 'package:consumer_app/modules/forgot-password/screen/forgot-password-screen.dart';
import 'package:consumer_app/modules/home/screen/home-screen.dart';
import 'package:consumer_app/modules/main/main-shell.dart';
import 'package:consumer_app/modules/profile/screen/profile-screen.dart';
import 'package:consumer_app/modules/setting/screen/setting-screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/sign-in/screen/sign_in_screen.dart';

final appKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static final appRoutes = GoRouter(
    navigatorKey: appKey,
    observers: [BotToastNavigatorObserver()],
    initialLocation: RoutePaths.account,
    redirect: (context, state) async {
      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.signIn,
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: RoutePaths.forgotPassword,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(shell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                name: RoutePaths.home,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: HomeScreen());
                },
              ),
              GoRoute(
                path: RoutePaths.account,
                name: RoutePaths.account,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: AccountScreen());
                },
              ),
              GoRoute(
                path: RoutePaths.setting,
                name: RoutePaths.setting,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: SettingScreen());
                },
              ),
              GoRoute(
                path: RoutePaths.profile,
                name: RoutePaths.profile,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: ProfileScreen());
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static Page createPage(Widget child, {bool enableTransition = true}) {
    if (Platform.isIOS) {
      return MaterialPage(child: child);
    }

    if (!enableTransition) {
      return NoTransitionPage(child: child);
    }

    return NoTransitionPage(child: child);
  }
}
