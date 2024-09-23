import 'package:flutter/material.dart';
import 'package:piction_ai_ry/components/title_component.dart';
import 'package:piction_ai_ry/screens/game_menu_screen.dart';
import 'package:piction_ai_ry/components/login_form.dart';
import 'package:piction_ai_ry/components/register_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _navigateToGameMenu(String token) {
    // Navigation vers la page de menu de jeu avec le token
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameMenuScreen(token: token),
      ),
    );
  }

  void _showRegisterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('S\'inscrire'),
          content: RegisterForm(onRegisterSuccess: (name) {
            Navigator.of(context).pop(); // Fermer le dialogue
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Inscription réussie pour $name')),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleText(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LoginForm(onLoginSuccess: _navigateToGameMenu),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showRegisterDialog,
                  child: const Text('S\'inscrire'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
