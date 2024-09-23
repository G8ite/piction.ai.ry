import 'package:flutter/material.dart';
import 'package:piction_ai_ry/utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PromptInput extends StatelessWidget {
  final TextEditingController promptController;

  const PromptInput({Key? key, required this.promptController}) : super(key: key);

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: promptController,
              decoration: const InputDecoration(
                hintText: 'Écrivez votre prompt ici...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: AppColors.lightBlue, size: 30),
            onPressed: () {
              if (promptController.text.isNotEmpty) {
                _showToast('Prompt envoyé: ${promptController.text}');
              } else {
                _showToast('Veuillez entrer un prompt');
              }
            },
          ),
        ],
      ),
    );
  }
}
