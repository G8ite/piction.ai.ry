import 'package:flutter/material.dart';
import 'package:piction_ai_ry/controllers/auth_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:piction_ai_ry/api/api_service.dart';

class LoginForm extends StatefulWidget {
  final Function(String) onLoginSuccess; // Callback pour le succès du login

  const LoginForm({Key? key, required this.onLoginSuccess}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AuthController _authController;

  @override
  void initState() {
    super.initState();
    _authController = AuthController(
      apiService: ApiService(),
      secureStorage: FlutterSecureStorage(),
    );
  }

  void _login() async {
    try {
      String token = await _authController.login(
        _nameController.text,
        _passwordController.text,
      );
      widget.onLoginSuccess(token);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de connexion: ${error.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            hintText: 'Nom d\'utilisateur',
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            hintText: 'Mot de passe',
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _login,
          child: const Text('Se connecter'),
        ),
      ],
    );
  }
}
