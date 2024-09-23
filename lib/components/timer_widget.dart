import 'package:flutter/material.dart';
import 'package:piction_ai_ry/utils/colors.dart';

class TimerWidget extends StatelessWidget {
  final int remainingSeconds;

  const TimerWidget({Key? key, required this.remainingSeconds}) : super(key: key);

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Temps restant: ${_formatTime(remainingSeconds)}',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.lightYellow,
        ),
      ),
    );
  }
}
