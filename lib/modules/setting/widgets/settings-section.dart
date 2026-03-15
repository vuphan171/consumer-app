import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/modules/setting/widgets/settings_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/settings-model.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsItemModel> items;

  const SettingsSection({super.key, required this.title, required this.items});
  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.headlineSmall),
          SizedBox(height: 10.h),
          ...items.map((item) => SettingsItem(title: item.title)),
        ],
      ),
    );
  }
}
