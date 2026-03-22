import 'package:consumer_app/modules/setting/widgets/delete-account.dart';
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Setting', style: theme.textTheme.displayLarge),
              SizedBox(height: 24.h),
              SettingsSection(title: 'General', items: generalSettings),
              SizedBox(height: 24.h),
              SettingsSection(
                title: 'Budget & Categories',
                items: budgetAndCategories,
              ),
              SizedBox(height: 24.h),
              SettingsSection(title: 'Data Management', items: dataManagement),
              SizedBox(height: 24.h),
              DeleteAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
