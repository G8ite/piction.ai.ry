import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://pictioniary.wevox.cloud/api';

  // Fonction pour créer un joueur
  Future<void> registerPlayer(String name, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/players'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'password': password}),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create player: ${response.body}');
    }
  }

  // Fonction pour se connecter
  Future<Map<String, dynamic>> login(String name, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'password': password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }
}
