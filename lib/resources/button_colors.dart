import 'package:flutter/material.dart';

class ButtonColors extends ThemeExtension<ButtonColors> {
  final Color enabledContainer;
  final Color enabledText;

  final Color disabledContainer;
  final Color disabledText;
  final Color disabledBorder;

  const ButtonColors({
    required this.enabledContainer,
    required this.enabledText,
    required this.disabledContainer,
    required this.disabledText,
    required this.disabledBorder,
  });

  @override
  ButtonColors copyWith({
    Color? enabledContainer,
    Color? enabledText,
    Color? disabledContainer,
    Color? disabledText,
    Color? disabledBorder,
  }) {
    return ButtonColors(
      enabledContainer: enabledContainer ?? this.enabledContainer,
      enabledText: enabledText ?? this.enabledText,
      disabledContainer: disabledContainer ?? this.disabledContainer,
      disabledText: disabledText ?? this.disabledText,
      disabledBorder: disabledBorder ?? this.disabledBorder,
    );
  }

  @override
  ButtonColors lerp(ThemeExtension<ButtonColors>? other, double t) {
    if (other is! ButtonColors) return this;
    return ButtonColors(
      enabledContainer: Color.lerp(
        enabledContainer,
        other.enabledContainer,
        t,
      )!,
      enabledText: Color.lerp(enabledText, other.enabledText, t)!,
      disabledContainer: Color.lerp(
        disabledContainer,
        other.disabledContainer,
        t,
      )!,
      disabledText: Color.lerp(disabledText, other.disabledText, t)!,
      disabledBorder: Color.lerp(disabledBorder, other.disabledBorder, t)!,
    );
  }
}
