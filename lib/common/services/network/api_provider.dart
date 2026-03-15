import 'package:consumer_app/common/services/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

/// API Service Provider
final apiServiceProvider = Provider<APIService>((ref) {
  final dio = ref.watch(dioProvider);
  return APIService(dio);
});
