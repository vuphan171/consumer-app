import '../api-response.dart';
import '../api_service.dart';

class AuthRepository {
  final APIService _service;

  AuthRepository(this._service);

  Future<ApiResponse<String>> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    final fakeJson = {
      "success": true,
      "message": "Login success",
      "data": "mock_token_123",
    };

    return ApiResponse.fromJson(fakeJson, (json) => json as String);
  }
}
