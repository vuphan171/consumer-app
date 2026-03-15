import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordProvider extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> forgotPassword(String email) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 2));

      if (email != 'phanzz147@gmail.com') {
        throw Exception('Email doest not exits');
      }
    });
  }
}

final forgotPasswordProvider =
    AsyncNotifierProvider<ForgotPasswordProvider, void>(
      ForgotPasswordProvider.new,
    );
