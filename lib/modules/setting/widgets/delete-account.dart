import 'package:consumer_app/common/widgets/app_button.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      state: ButtonState.active,
      type: ButtonType.destructive,
      variant: ButtonVariant.outlined,
      text: 'Delete account',
      onPressed: () {},
    );
  }
}
