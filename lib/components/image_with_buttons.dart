import 'package:flutter/material.dart';
import 'package:piction_ai_ry/utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImageWithButtons extends StatelessWidget {
  final String imageUrl;

  const ImageWithButtons({Key? key, required this.imageUrl}) : super(key: key);

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _showToast('Image regénérée');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightBlue,
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('(-50pts)', style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.send, color: AppColors.lightYellow, size: 30),
                  onPressed: () {
                    _showToast('Devineur envoyé');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
