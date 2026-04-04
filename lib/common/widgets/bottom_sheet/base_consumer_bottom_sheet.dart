import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseConsumerBottomSheet extends ConsumerStatefulWidget {
  const BaseConsumerBottomSheet({super.key});

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
      builder: (_) => this,
    );
  }
}

abstract class BaseConsumerBottomSheetState<T extends BaseConsumerBottomSheet>
    extends ConsumerState<T> {
  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }

  void closeDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  Widget buildContent(BuildContext context);
}
