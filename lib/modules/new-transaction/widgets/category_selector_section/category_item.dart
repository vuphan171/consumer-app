import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;

  const CategoryItem({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      child: Row(
        children: [
          Container(
            width: 36.r,
            height: 36.r,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(36.r),
            ),
          ),
          SizedBox(width: 8.w),
          Text(categoryName, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
