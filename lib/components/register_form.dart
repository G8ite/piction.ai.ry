import 'package:flutter/material.dart';
import 'package:piction_ai_ry/controllers/auth_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:piction_ai_ry/api/api_service.dart';

class RegisterForm extends StatefulWidget {
  final Function(String) onRegisterSuccess;

  const RegisterForm({Key? key, required this.onRegisterSuccess}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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

  void _register() async {
    try {
      await _authController.register(
        _nameController.text,
        _passwordController.text,
      );
      widget.onRegisterSuccess(_nameController.text); // Appel de la fonction de succès
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur d\'inscription: ${error.toString()}')),
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
          onPressed: _register,
          child: const Text('S\'inscrire'),
        ),
      ],
    );
  }
}
