import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:piction_ai_ry/api/api_service.dart';

class AuthController {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  AuthController({required this.apiService, required this.secureStorage});

  Future<bool> register(String name, String password) async {
    try {
      await apiService.registerPlayer(name, password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> login(String name, String password) async {
    try {
      final response = await apiService.login(name, password);
      await secureStorage.write(key: 'token', value: response['token']);
      return response['token'];
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout() async {
    await secureStorage.delete(key: 'token');
  }

  Future<bool> isAuthenticated() async {
    final token = await secureStorage.read(key: 'token');
    return token != null;
  }
}
