import 'dart:async';

import 'package:consumer_app/utils/app_shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/services/network/providers/auth_provider.dart';

class SignInProvider extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);

      final result = await repo.signIn(email, password);

      if (!result.success) {
        throw Exception(result.message);
      }

      final token = result.data!;

      await AppSharedPref.setAccessToken(token);
    });
  }
}

final signInProvider = AsyncNotifierProvider.autoDispose<SignInProvider, void>(
  SignInProvider.new,
);
