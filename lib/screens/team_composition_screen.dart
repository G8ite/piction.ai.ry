import 'package:flutter/material.dart';
import 'package:piction_ai_ry/components/custom_app_bar.dart';
import 'package:piction_ai_ry/utils/colors.dart';
import 'package:piction_ai_ry/components/background_image.dart';
import 'package:piction_ai_ry/screens/challenge_menu_screen.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class TeamCompositionScreen extends StatelessWidget {
  final String pseudo;

  const TeamCompositionScreen({super.key, required this.pseudo});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Composition des équipes',
      ),
      body: BackgroundImage(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Ajout du QR Code ici
            PrettyQr(
              data: 'Team Composition: $pseudo in Équipe Bleue',
              size: 120.0, // Taille du QR code
              errorCorrectLevel: QrErrorCorrectLevel.M,
              roundEdges: true,
              elementColor: Colors.white, // Couleur des éléments du QR code
              image: AssetImage('assets/images/flutter.png'), // Votre image personnalisée si besoin
            ),
            const SizedBox(height: 24), // Espace entre le QR code et les rectangles
            Expanded(
              flex: 2,
              child: Container(
                width: screenWidth - 32,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Équipe Bleue',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '1. $pseudo',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '2. Joueur 2',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: Container(
                width: screenWidth - 32,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Équipe Rouge',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1. Joueur 1',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '2. Joueur 2',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'La partie sera lancée automatiquement une fois les équipes complètes.',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: AppColors.lightYellow,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      // Ajout du FAB (FloatingActionButton) "GO"
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChallengeMenuScreen(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Partie lancée !')),
          );
        },
        tooltip: 'Lancer la partie',
        child: const Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // FAB en bas à droite
    );
  }
}
