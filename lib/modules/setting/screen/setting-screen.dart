import 'package:consumer_app/gen/assets.gen.dart';
import 'package:consumer_app/modules/setting/widgets/setting_option_tile.dart';
import 'package:consumer_app/modules/setting/widgets/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/settings-model.dart';
import '../widgets/settings-section.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Setting', style: theme.textTheme.displayLarge),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingsSection(
                        title: 'Personal',
                        items: personalSettings,
                      ),
                      SettingsSection(title: 'Shop', items: shopSettings),
                      SettingsSection(title: 'Account', items: accountSettings),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
