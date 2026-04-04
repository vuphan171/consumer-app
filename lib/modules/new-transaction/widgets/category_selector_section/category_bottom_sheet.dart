import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:consumer_app/common/widgets/bottom_sheet/base_consumer_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_item.dart';

const List<String> categories = [
  "Food & Dining",
  "Transportation",
  "Shopping",
  "Bills & Utilities",
  "Entertainment",
  "Health & Fitness",
  "Education",
  "Travel",
  "Personal Care",
  "Other",
];

class CategoryBottomSheet extends BaseConsumerBottomSheet {
  const CategoryBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      CategoryBottomSheetState();
}

class CategoryBottomSheetState
    extends BaseConsumerBottomSheetState<CategoryBottomSheet> {
  @override
  Widget buildContent(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CategoryItem(categoryName: categories[index]);
        },
      ),
    );
  }
}
