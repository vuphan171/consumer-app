import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/modules/forgot-password/provider/forgot-password-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../common/extension/async_value_extension.dart';
import '../../../common/form/custom_reactive_text_field.dart';
import '../../../common/widgets/app_button.dart';
import '../../../gen/assets.gen.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final FormGroup form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
  });

  @override
  void initState() {
    super.initState();

    ref.listenManual<AsyncValue<void>>(forgotPasswordProvider, (prev, next) {
      next.whenOrNull(
        data: (_) {
          showDialog(
            context: context,
            builder: (_) => const CupertinoAlertDialog(
              title: Text('Success'),
              content: Text('Reset password link sent'),
            ),
          );
        },
        error: (e, _) {
          showDialog(
            context: context,
            builder: (_) => CupertinoAlertDialog(
              title: Text('Error'),
              content: Text(e.toString()),
            ),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    final state = ref.watch(forgotPasswordProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Assets.images.svg.icArrowLeft.svg(
                    width: 20.r,
                    height: 20.r,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: ReactiveForm(
                  formGroup: form,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Forgot password',
                                  style: theme.textTheme.displayLarge?.copyWith(
                                    height: 1.2,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Enter your email and we will send a reset link.',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              SizedBox(height: 24.h),
                              CustomReactiveTextField(
                                formControlName: 'email',
                                labelText: 'Email',
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: const [AutofillHints.email],
                                validationMessages: {
                                  ValidationMessage.required:
                                      'Email is required',
                                  ValidationMessage.email: 'Email invalid',
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      ReactiveFormConsumer(
                        builder: (context, form, _) {
                          final btnState = state.toButtonState(form.valid);
                          return AppButton(
                            state: btnState,
                            type: ButtonType.secondary,
                            text: 'Next',
                            onPressed: () {
                              final email =
                                  form.control('email').value as String;
                              ref
                                  .read(forgotPasswordProvider.notifier)
                                  .forgotPassword(email);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
