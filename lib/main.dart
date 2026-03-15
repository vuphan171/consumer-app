import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:consumer_app/resources/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/navigation/app_routes.dart';

void main() async {
  GoogleFonts.config.allowRuntimeFetching = false;
  await ScreenUtil.ensureScreenSize();
  runApp(const ProviderScope(child: ConsumerApp()));
}

class ConsumerApp extends StatelessWidget {
  const ConsumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AdaptiveTheme(
          light: lightTheme,
          dark: lightTheme,
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.appRoutes,
            theme: theme,
            darkTheme: darkTheme,
            builder: (context, child) {
              child = BotToastInit()(context, child);
              return child;
            },
          ),
        );
      },
    );
  }
}
