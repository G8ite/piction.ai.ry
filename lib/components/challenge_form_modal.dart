import 'package:flutter/material.dart';

class ChallengeFormModal extends StatefulWidget {
  final int challengeNumber;
  final Function(String, List<String>) onChallengeCreated;

  const ChallengeFormModal({
    Key? key,
    required this.challengeNumber,
    required this.onChallengeCreated,
  }) : super(key: key);

  @override
  _ChallengeFormModalState createState() => _ChallengeFormModalState();
}

class _ChallengeFormModalState extends State<ChallengeFormModal> {
  late String text1;
  late String text2;
  final List<String> forbiddenWords = [];
  final TextEditingController forbiddenWordController = TextEditingController();

  int step = 1;
  int selectedDeterminantIndex1 = 0; // 0 for "un", 1 for "une"
  int selectedPrepositionIndex = 0; // 0 for "dans", 1 for "sur"
  int selectedDeterminantIndex2 = 0; // 0 for "un", 1 for "une"

  @override
  void initState() {
    super.initState();
    text1 = '';
    text2 = '';
  }

  void _addForbiddenWord() {
    final word = forbiddenWordController.text.trim();
    if (word.isNotEmpty) {
      setState(() {
        forbiddenWords.add(word);
        forbiddenWordController.clear();
      });
    }
  }

  void _submitForm() {
    final determinant1 = selectedDeterminantIndex1 == 0 ? 'un' : 'une';
    final prepositionText = selectedPrepositionIndex == 0 ? 'dans' : 'sur';
    final determinant2 = selectedDeterminantIndex2 == 0 ? 'un' : 'une';
    final challengeText = 'Challenge n°${widget.challengeNumber}: $determinant1 $text1 $prepositionText $determinant2 $text2';
    widget.onChallengeCreated(challengeText, forbiddenWords);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Créer un Challenge n°${widget.challengeNumber}'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            if (step == 1) ...[
              ToggleButtons(
                children: const [
                  Text('un'),
                  Text('une'),
                ],
                isSelected: [selectedDeterminantIndex1 == 0, selectedDeterminantIndex1 == 1],
                onPressed: (int index) {
                  setState(() {
                    selectedDeterminantIndex1 = index;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Texte 1'),
                onChanged: (value) {
                  text1 = value;
                },
              ),
              ToggleButtons(
                children: const [
                  Text('dans'),
                  Text('sur'),
                ],
                isSelected: [selectedPrepositionIndex == 0, selectedPrepositionIndex == 1],
                onPressed: (int index) {
                  setState(() {
                    selectedPrepositionIndex = index;
                  });
                },
              ),
              ToggleButtons(
                children: const [
                  Text('un'),
                  Text('une'),
                ],
                isSelected: [selectedDeterminantIndex2 == 0, selectedDeterminantIndex2 == 1],
                onPressed: (int index) {
                  setState(() {
                    selectedDeterminantIndex2 = index;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Texte 2'),
                onChanged: (value) {
                  text2 = value;
                },
              ),
            ] else ...[
              TextField(
                controller: forbiddenWordController,
                decoration: InputDecoration(
                  labelText: 'Ajouter un mot interdit',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addForbiddenWord,
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Annuler'),
        ),
        if (step == 1)
          TextButton(
            onPressed: () {
              setState(() {
                step = 2; // Passe à l'étape 2
              });
            },
            child: const Text('Suivant'),
          ),
        if (step == 2)
          TextButton(
            onPressed: _submitForm,
            child: const Text('Créer Challenge'),
          ),
      ],
    );
  }
}
