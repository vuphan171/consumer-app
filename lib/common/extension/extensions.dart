import 'package:flutter/material.dart';

extension UnfocusExt on BuildContext {
  void unFocus() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }
  }
}
