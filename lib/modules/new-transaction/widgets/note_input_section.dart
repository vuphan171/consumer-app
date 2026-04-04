import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteInputSection extends StatelessWidget {
  const NoteInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Notes', style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.h),
        TextField(
          maxLines: 4,
          minLines: 4,
          decoration: InputDecoration(
            hintText: "Additional notes...",
            filled: true,
            fillColor: theme.colorScheme.outlineVariant,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none, // bỏ viền
            ),
          ),
        ),
      ],
    );
  }
}
