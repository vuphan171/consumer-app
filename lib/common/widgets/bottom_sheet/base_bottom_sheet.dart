import 'dart:async';
import 'package:flutter/material.dart';

abstract class BaseBottomSheet {
  Future<T?> show<T>(
    BuildContext context, {
    bool? isScrollControlled,
    bool? enableDrag,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled ?? true,
      enableDrag: enableDrag ?? true,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 4,
      shape:
          shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
      builder: (context) => buildContent(context),
    );
  }

  void closeSheet(BuildContext context, [dynamic result]) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(result);
    }
  }

  Widget buildContent(BuildContext context);
}
