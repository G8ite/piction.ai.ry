import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  final String challengeText;
  final List<String> forbiddenWords;

  const ChallengeCard({
    Key? key,
    required this.challengeText,
    required this.forbiddenWords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            challengeText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          // Mots interdits affichés en tant que chips
          Wrap(
            spacing: 8.0,
            children: forbiddenWords.map((word) {
              return Chip(
                label: Text(word),
                backgroundColor: Colors.redAccent.shade100,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
