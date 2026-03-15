import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color? badgeStar;
  final Color? cardShadow;
  final Color? success;
  final Color? warning;

  const CustomColors({
    required this.badgeStar,
    required this.cardShadow,
    required this.success,
    required this.warning,
  });

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
      badgeStar: badgeStar ?? badgeStar,
      cardShadow: cardShadow ?? cardShadow,
      success: success ?? success,
      warning: warning ?? warning,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
    covariant ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      badgeStar: Color.lerp(badgeStar, other.badgeStar, t),
      cardShadow: Color.lerp(cardShadow, other.cardShadow, t),
      success: Color.lerp(success, other.success, t),
      warning: Color.lerp(warning, other.warning, t),
    );
  }
}
