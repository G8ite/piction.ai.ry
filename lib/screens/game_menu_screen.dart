import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:piction_ai_ry/components/custom_app_bar.dart';
import 'package:piction_ai_ry/components/title_component.dart';
import 'package:piction_ai_ry/screens/team_composition_screen.dart';
import 'package:piction_ai_ry/screens/loading_screen.dart';

class GameMenuScreen extends StatelessWidget {
  final String pseudo;

  const GameMenuScreen({super.key, required this.pseudo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Menu du jeu'),
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
                Text(
                  'Bonjour, $pseudo',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamCompositionScreen(pseudo: pseudo),
                      ),
                    );
                  },
                  child: const Text('Nouvelle partie'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoadingScreen(),
                      ),
                    );
                  },
                  icon: const Icon(IconlyLight.scan),
                  label: const Text('Rejoindre une partie'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
