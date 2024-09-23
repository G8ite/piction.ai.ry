import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:piction_ai_ry/components/custom_app_bar.dart';
import 'package:piction_ai_ry/components/background_image.dart';

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Rejoindre une partie',
      ),
      body: BackgroundImage(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: QRCodeDartScanView(
                  scanInvertedQRCode: true,
                  onCapture: (result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('QR Code capturé : $result')),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
