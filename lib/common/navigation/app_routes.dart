import 'dart:io';
import 'package:consumer_app/common/navigation/route_paths.dart';
import 'package:consumer_app/modules/forgot-password/screen/forgot-password-screen.dart';
import 'package:consumer_app/modules/home/screen/home-screen.dart';
import 'package:consumer_app/modules/main/main-shell.dart';
import 'package:consumer_app/modules/setting/screen/setting-screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/sign-in/screen/sign_in_screen.dart';

final appKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static final appRoutes = GoRouter(
    navigatorKey: appKey,
    observers: [],
    initialLocation: RoutePaths.signIn,
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
      GoRoute(
        path: RoutePaths.setting,
        builder: (context, state) => SettingScreen(),
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
