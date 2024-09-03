import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:piction_ai_ry/components/background_image.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Center(
          child: LoadingAnimationWidget.discreteCircle(
            color: Colors.white,
            size: 100,
            secondRingColor: Colors.blueAccent,
            thirdRingColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
