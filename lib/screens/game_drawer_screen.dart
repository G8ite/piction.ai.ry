import 'package:flutter/material.dart';
import 'package:piction_ai_ry/components/custom_app_bar.dart';
import 'package:piction_ai_ry/utils/colors.dart';
import 'dart:async';
import 'package:piction_ai_ry/components/timer_widget.dart';
import 'package:piction_ai_ry/components/challenge_card.dart';
import 'package:piction_ai_ry/components/image_with_buttons.dart';
import 'package:piction_ai_ry/components/prompt_input.dart';

class GameDrawerScreen extends StatefulWidget {
  final String challengeText; // Contenu du challenge
  final List<String> forbiddenWords; // Liste des mots interdits

  const GameDrawerScreen({
    Key? key,
    required this.challengeText,
    required this.forbiddenWords,
  }) : super(key: key);

  @override
  _GameDrawerScreenState createState() => _GameDrawerScreenState();
}

class _GameDrawerScreenState extends State<GameDrawerScreen> {
  Timer? _timer;
  int _remainingSeconds = 300; // Temps initial: 5 minutes (300 secondes)
  final TextEditingController _promptController = TextEditingController();
  final String _imageUrl = 'https://source.unsplash.com/random'; // URL de l'image aléatoire

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _promptController.dispose();
    super.dispose();
  }

  // Démarre le chronomètre
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        // Action lorsque le temps est écoulé
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dessiner le Challenge',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Utilisation du widget Timer
            TimerWidget(remainingSeconds: _remainingSeconds),
            const SizedBox(height: 24),

            // Utilisation du widget ChallengeCard
            ChallengeCard(
              challengeText: widget.challengeText,
              forbiddenWords: widget.forbiddenWords,
            ),
            const SizedBox(height: 24),

            // Utilisation du widget ImageWithButtons
            ImageWithButtons(imageUrl: _imageUrl),
            const SizedBox(height: 16),

            // Utilisation du widget PromptInput
            PromptInput(promptController: _promptController),
          ],
        ),
      ),
      backgroundColor: AppColors.darkBlue, // Couleur de fond principale
    );
  }
}
