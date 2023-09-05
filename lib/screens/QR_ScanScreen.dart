import 'dart:io';

import 'package:app_cba/screens/DetailQR_Scan.dart';
import 'package:app_cba/screens/Overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QR_Scan_Screen extends StatefulWidget {
  const QR_Scan_Screen({super.key});

  @override
  State<QR_Scan_Screen> createState() => _QR_Scan_ScreenState();
}

class _QR_Scan_ScreenState extends State<QR_Scan_Screen> {
  File? image;
  bool isScanComplete = false;
  bool isFlashOn = false;
  bool isCameraFront = false;
  MobileScannerController controller = MobileScannerController();
  void closeScreen() {
    isScanComplete = false;
  }

  Future<void> openAlbum() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      } else {
        final image2 = File(image.path);
        setState(() {
          this.image = image2;
        });
      }
    } on PlatformException {
      print("Failed to pick image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFlashOn = !isFlashOn;
                });
                controller.toggleTorch();
              },
              icon: const Icon(Icons.flash_on)),
          IconButton(
              onPressed: () {
                setState(() {
                  isCameraFront = !isCameraFront;
                });
                controller.switchCamera();
              },
              icon: const Icon(Icons.camera_front))
        ],
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
        title: const Text("Quét mã QR Code"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                MobileScanner(
                  allowDuplicates: false,
                  controller: controller,
                  onDetect: (barcode, args) {
                    if (!isScanComplete) {
                      String code = barcode.rawValue ?? '---';
                      isScanComplete = true;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Detail_QRSCAN(
                              closeScreen: closeScreen, code: code);
                        },
                      ));
                    }
                  },
                ),
                QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
                Positioned(
                  top: 20,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Hướng camera về phía mã QR",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Positioned(
                    left: 20,
                    bottom: 30,
                    child: GestureDetector(
                      onTap: openAlbum,
                      child: const Icon(
                        Icons.image,
                        size: 40,
                        color: Colors.white,
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
