import 'package:consumer_app/common/services/network/api_provider.dart';
import 'package:consumer_app/common/services/network/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final service = ref.watch(apiServiceProvider);
  return AuthRepository(service);
});
