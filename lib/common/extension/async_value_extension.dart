import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/app_button.dart';

extension AsyncValueButtonState on AsyncValue {
  ButtonState toButtonState(bool formValid) {
    if (!formValid) return ButtonState.disabled;
    if (isLoading) return ButtonState.loading;
    return ButtonState.active;
  }
}
