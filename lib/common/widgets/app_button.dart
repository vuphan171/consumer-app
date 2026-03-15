import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonVariant { filled, outlined, text }

enum ButtonType { primary, secondary, destructive }

enum ButtonState {
  active,
  disabled,
  loading;

  ButtonState operator &(covariant ButtonState other) {
    return this == ButtonState.active && other == ButtonState.active
        ? ButtonState.active
        : ButtonState.disabled;
  }

  operator |(covariant ButtonState other) {
    return this == ButtonState.active || other == ButtonState.active
        ? ButtonState.active
        : ButtonState.loading;
  }
}

class AppButton extends StatelessWidget {
  final ButtonVariant variant;
  final ButtonType type;
  final ButtonState state;
  final String? text;
  final VoidCallback onPressed;
  final Widget? textWidget;
  final Widget? icon;
  final double height;
  final double? width;
  final Color? color;
  final TextStyle? titleStyle;
  final BorderRadius? borderRadius;

  const AppButton({
    super.key,
    required this.state,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.variant = ButtonVariant.filled,
    this.text,
    this.textWidget,
    this.icon,
    this.width,
    this.height = 44,
    this.color,
    this.titleStyle,
    this.borderRadius,
  });

  Color getPressBgColor(ThemeData theme) {
    if (variant == ButtonVariant.outlined || variant == ButtonVariant.text) {
      return theme.colorScheme.surfaceContainer.withValues(alpha: 0.15);
    }

    switch (type) {
      case ButtonType.primary:
        return theme.colorScheme.primary.withValues(alpha: 0.85);
      case ButtonType.secondary:
        return theme.colorScheme.secondary.withValues(alpha: 0.85);
      case ButtonType.destructive:
        return theme.colorScheme.error.withValues(alpha: 0.85);
    }
  }

  Color getBgColor(ThemeData theme) {
    if (variant == ButtonVariant.outlined || variant == ButtonVariant.text) {
      return theme.colorScheme.surfaceContainer;
    }

    switch (type) {
      case ButtonType.primary:
        return theme.colorScheme.primary;
      case ButtonType.secondary:
        return theme.colorScheme.secondary;
      case ButtonType.destructive:
        return theme.colorScheme.error;
    }
  }

  Color getTextColor(ThemeData theme) {
    final bool isOutlinedOrText =
        variant == ButtonVariant.outlined || variant == ButtonVariant.text;

    final Color baseColor = switch (type) {
      ButtonType.primary =>
        isOutlinedOrText
            ? theme.colorScheme.primary
            : theme.colorScheme.onPrimary,

      ButtonType.secondary =>
        isOutlinedOrText
            ? theme.colorScheme.secondary
            : theme.colorScheme.onSecondary,

      ButtonType.destructive =>
        isOutlinedOrText ? theme.colorScheme.error : theme.colorScheme.onError,
    };

    final double alpha =
        state == ButtonState.active || variant == ButtonVariant.filled
        ? 1.0
        : 0.65;

    return baseColor.withValues(alpha: alpha);
  }

  Color getBorderColor(ThemeData theme) {
    if (variant == ButtonVariant.text || variant == ButtonVariant.filled) {
      return Colors.transparent;
    }

    switch (type) {
      case ButtonType.primary:
        return theme.colorScheme.primary;
      case ButtonType.secondary:
        return theme.colorScheme.secondary;
      case ButtonType.destructive:
        return theme.colorScheme.error;
    }
  }

  Color getIconLoadingColor(ThemeData theme) {
    if (variant == ButtonVariant.outlined || variant == ButtonVariant.text) {
      switch (type) {
        case ButtonType.primary:
          return theme.colorScheme.primary.withValues(alpha: 0.65);
        case ButtonType.secondary:
          return theme.colorScheme.secondary.withValues(alpha: 0.65);
        case ButtonType.destructive:
          return theme.colorScheme.error.withValues(alpha: 0.65);
      }
    }

    switch (type) {
      case ButtonType.primary:
        return theme.colorScheme.onPrimary.withValues(alpha: 0.65);
      case ButtonType.secondary:
        return theme.colorScheme.onSecondary.withValues(alpha: 0.65);
      case ButtonType.destructive:
        return theme.colorScheme.onError.withValues(alpha: 0.65);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    final bgColor = getBgColor(theme);
    final pressBgColor = getPressBgColor(theme);
    final borderColor = getBorderColor(theme);

    Widget button = FilledButton(
      onPressed: state == ButtonState.active ? onPressed : null,
      style:
          FilledButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            overlayColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8.r),
            ),
            side: BorderSide(color: borderColor),
          ).copyWith(
            side: WidgetStateProperty.resolveWith<BorderSide>((states) {
              if (borderColor == Colors.transparent) {
                return BorderSide(color: borderColor);
              }
              if (state == ButtonState.loading) {
                return BorderSide(color: borderColor.withValues(alpha: 0.65));
              }
              if (state == ButtonState.disabled) {
                return BorderSide(color: borderColor.withValues(alpha: 0.5));
              }
              return BorderSide(color: borderColor);
            }),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (state == ButtonState.loading) {
                return bgColor.withValues(alpha: 0.65);
              }
              if (state == ButtonState.disabled) {
                return bgColor.withValues(alpha: 0.5);
              }
              if (states.contains(WidgetState.pressed)) {
                return pressBgColor;
              }
              return bgColor;
            }),
          ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildChild(context),
      ),
    );

    if (icon != null) {
      button = FilledButton.icon(
        onPressed: state == ButtonState.active ? onPressed : null,
        style:
            FilledButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              overlayColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8.r),
              ),
              side: BorderSide(color: borderColor),
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return theme.colorScheme.onSurface;
                }
                if (states.contains(WidgetState.pressed)) {
                  return pressBgColor;
                }
                return bgColor;
              }),
            ),
        label: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _buildChild(context),
        ),
        icon: state == ButtonState.loading ? null : icon,
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: width ?? double.infinity,
      height: height.h,
      child: button,
    );
  }

  Widget _buildChild(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    final textColor = getTextColor(theme);
    final iconColor = getIconLoadingColor(theme);

    if (state == ButtonState.loading) {
      return SizedBox(
        width: 20.r,
        height: 20.r,
        child: CircularProgressIndicator(color: iconColor, strokeWidth: 1.5.r),
      );
    }

    return textWidget ??
        Text(
          text ?? '',
          key: ValueKey(state),
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: titleStyle?.fontSize,
            fontWeight: titleStyle?.fontWeight,
            color: textColor,
          ),
        );
  }
}
