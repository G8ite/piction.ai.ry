import 'package:flutter/material.dart';
import 'package:piction_ai_ry/components/custom_app_bar.dart';
import 'package:piction_ai_ry/utils/colors.dart';
import 'package:piction_ai_ry/components/background_image.dart';
import 'package:piction_ai_ry/components/challenge_form_modal.dart';
import 'package:piction_ai_ry/screens/game_drawer_screen.dart'; // Import de GameDrawerScreen
import 'package:fluttertoast/fluttertoast.dart'; // Pour afficher des toasts

class ChallengeMenuScreen extends StatefulWidget {
  @override
  _ChallengeMenuScreenState createState() => _ChallengeMenuScreenState();
}

class _ChallengeMenuScreenState extends State<ChallengeMenuScreen> {
  List<Map<String, dynamic>> challenges = []; // Stocke les challenges avec les mots interdits

  // Fonction pour ajouter un challenge à la liste
  void _addChallenge(Map<String, dynamic> challenge) {
    setState(() {
      challenges.add(challenge);
    });
  }

  // Fonction pour supprimer un challenge
  void _removeChallenge(int index) {
    setState(() {
      challenges.removeAt(index);
    });
  }

  // Fonction pour lancer la partie
  void _startGame() {
    if (challenges.isEmpty) {
      // Affiche un toast si aucun challenge n'est créé
      Fluttertoast.showToast(
        msg: 'Veuillez créer un challenge avant de démarrer la partie.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      // Naviguer vers la page GameDrawerScreen en passant les challenges
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameDrawerScreen(
            challengeText: challenges[0]['text'], // Le premier challenge pour l'exemple
            forbiddenWords: challenges[0]['forbiddenWords'], // Les mots interdits du premier challenge
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Challenges disponibles',
      ),
      body: BackgroundImage(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Affichage de la liste des challenges
            Expanded(
              child: ListView.builder(
                itemCount: challenges.length,
                itemBuilder: (context, index) {
                  final challenge = challenges[index];
                  return Container(
                    width: screenWidth - 32,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Challenge n°${index + 1}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.white),
                              onPressed: () {
                                _removeChallenge(index); // Supprime le challenge
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          challenge['text'], // Texte du challenge
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Affichage des mots interdits
                        Wrap(
                          spacing: 8.0,
                          children: (challenge['forbiddenWords'] as List<String>).map((word) {
                            return Chip(
                              label: Text(word),
                              backgroundColor: Colors.redAccent.shade100,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Bouton pour lancer la partie
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _startGame,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  backgroundColor: AppColors.lightYellow,
                ),
                child: const Text(
                  'Lancer la Partie',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Créez ou sélectionnez un challenge pour démarrer.',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ChallengeFormModal(
                challengeNumber: challenges.length + 1,
                onChallengeCreated: (String challenge, List<String> forbiddenWords) {
                  _addChallenge({
                    'text': challenge,
                    'forbiddenWords': forbiddenWords,
                  }); // Ajout du challenge avec les mots interdits
                },
              );
            },
          );
        },
        tooltip: 'Ajouter un challenge',
        backgroundColor: AppColors.lightBlue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
