import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/modules/setting/widgets/setting-action-item.dart';
import 'package:consumer_app/modules/setting/widgets/setting-navigation-item.dart';
import 'package:consumer_app/modules/setting/widgets/setting-toggle-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/settings-model.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsItemModel> items;

  const SettingsSection({super.key, required this.title, required this.items});

  Widget buildItem(SettingsItemModel item) {
    return switch (item) {
      NavigationItem() => SettingNavigationItem(title: item.title),
      ToggleItem() => SettingToggleItem(title: item.title, value: item.value),
      ActionItem() => SettingActionItem(title: item.title, value: item.value),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.h),
          ...items.map((item) => buildItem(item)),
        ],
      ),
    );
  }
}
