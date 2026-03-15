import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../gen/assets.gen.dart';

class CustomReactiveTextField extends StatefulWidget {
  final String formControlName;
  final String labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final Map<String, String> validationMessages;
  final bool isPassword;
  final bool showClearButton;
  final bool readOnly;
  final void Function(FormControl<String>)? onTap;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;

  const CustomReactiveTextField({
    super.key,
    required this.formControlName,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.style,
    this.validationMessages = const {},
    this.isPassword = false,
    this.showClearButton = true,
    this.readOnly = false,
    this.onTap,
    this.hintText,
    this.textInputAction,
    this.autofillHints,
  });

  @override
  State<CustomReactiveTextField> createState() =>
      _CustomReactiveTextFieldState();
}

class _CustomReactiveTextFieldState extends State<CustomReactiveTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          Text(widget.labelText, style: theme.textTheme.labelLarge),
          SizedBox(height: 4.h),
        ],
        ReactiveTextField<String>(
          formControlName: widget.formControlName,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          autofillHints: widget.autofillHints,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputFormatters,
          cursorColor: theme.colorScheme.onSurface,
          onTap: widget.onTap,
          style: theme.textTheme.bodyMedium,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 16.w,
            ),
            errorStyle: TextStyle(fontSize: 0),
            errorMaxLines: 1,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: theme.colorScheme.outline,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: theme.colorScheme.outline,
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 1.0,
              ),
            ),
            suffixIcon: _buildSuffixIcon(),
          ),
        ),
        ReactiveStatusListenableBuilder(
          formControlName: widget.formControlName,
          builder: (context, control, child) {
            if (control.invalid && control.touched) {
              for (final error in control.errors.keys) {
                final message = widget.validationMessages[error];
                if (message != null) {
                  return Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Text(
                      message,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                  );
                }
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: IconButton(
          icon: _obscureText
              ? Assets.images.svg.icEyeOn.svg()
              : Assets.images.svg.icEyeOff.svg(),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      );
    }
    return null;
  }
}
