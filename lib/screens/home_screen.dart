import 'package:flutter/material.dart';
import 'package:piction_ai_ry/components/title_component.dart';
import 'game_menu_screen.dart'; // Import de la nouvelle page

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _pseudoController = TextEditingController();

  void _validatePseudo() {
    final String pseudo = _pseudoController.text;
    if (pseudo.isNotEmpty) {
      // Navigation vers la nouvelle page avec le pseudo
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameMenuScreen(pseudo: pseudo),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez entrer un pseudo')),
      );
    }
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
                  child: TextField(
                    controller: _pseudoController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black54,
                      hintText: 'Entrez votre pseudo',
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _validatePseudo,

                  child: const Text('Valider'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
