import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:consumer_app/common/form/custom_reactive_text_field.dart';
import 'package:consumer_app/common/widgets/app_button.dart';

import '../../../common/extension/async_value_extension.dart';
import '../provider/sign_in_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends ConsumerState<SignInScreen> {
  final FormGroup form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(6),
        Validators.maxLength(15),
      ],
    ),
  });

  @override
  void initState() {
    super.initState();

    ref.listenManual<AsyncValue<void>>(signInProvider, (prev, next) {
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

  void _onSubmit() {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    final value = form.value;
    final email = value['email'] as String;
    final password = value['password'] as String;

    ref.read(signInProvider.notifier).signIn(email, password);
  }

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    final state = ref.watch(signInProvider);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: ReactiveForm(
              formGroup: form,
              child: AutofillGroup(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: theme.textTheme.displaySmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    CustomReactiveTextField(
                      formControlName: 'email',
                      labelText: 'Email',
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      textInputAction: TextInputAction.next,
                      validationMessages: {
                        ValidationMessage.required: 'Email is required',
                        ValidationMessage.email: 'Email invalid',
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomReactiveTextField(
                      formControlName: 'password',
                      isPassword: true,
                      labelText: 'Password',
                      hintText: 'Password',
                    ),
                    SizedBox(height: 36.h),
                    ReactiveFormConsumer(
                      builder: (context, form, _) {
                        final btnState = state.toButtonState(form.valid);
                        return AppButton(
                          state: btnState,
                          type: ButtonType.secondary,
                          text: 'Sign In',
                          onPressed: _onSubmit,
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    AppButton(
                      state: ButtonState.active,
                      variant: ButtonVariant.text,
                      type: ButtonType.secondary,
                      text: 'Forgot Password?',
                      onPressed: () {
                        // TODO: navigate
                      },
                    ),
                    SizedBox(height: 8.h),
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: 'Don’t have an account yet? '),
                          TextSpan(
                            text: 'Sign Up',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
