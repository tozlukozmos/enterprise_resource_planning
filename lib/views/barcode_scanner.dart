import 'dart:io';

import 'package:enterprise_resource_planning/design/app_colors.dart';

import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  static int referenceNumber = 0;

  @override
  State<BarcodeScanner> createState() => _BarcodeScanner();
}

class _BarcodeScanner extends State<BarcodeScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? qrController;

  @override
  Widget build(BuildContext context) {
    if (qrController != null && mounted) {
      qrController!.pauseCamera();
      qrController!.resumeCamera();
    }

    final arg  = ModalRoute.of(context)!.settings.arguments as Map;
    final _screen = arg['screen'];

    Widget buildResult() {
      return barcode != null
          ? ElevatedButton(
              onPressed: () => {
                    BarcodeScanner.referenceNumber = int.parse(barcode!.code!),
                    Navigator.pushReplacementNamed(context, _screen)
                  },
              child: const Text("sonraki sayfaya geçiniz"))
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightSecondary),
                color: AppColors.lightPrimary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Lütfen bir QR kod okutunuz',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                  color: AppColors.lightSecondary,
                ),
              ),
            );
    }

    void onQRViewCreated(QRViewController controller) {
      setState(() => qrController = controller);
      controller.scannedDataStream.listen((barcode) => setState(() => {
            this.barcode = barcode,
            BarcodeScanner.referenceNumber = int.parse(barcode.code!),
            Navigator.pushReplacementNamed(context, _screen)
          }));
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            QRView(
              cameraFacing: CameraFacing.back,
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: AppColors.lightSecondary,
                borderRadius: 40,
                borderWidth: 12,
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Positioned(bottom: 20, child: buildResult()),
            Positioned(top: 20, child: buildControlButtons())
          ],
        ),
      ),
    );
  }

  Widget buildControlButtons() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightSecondary),
          borderRadius: BorderRadius.circular(4),
          color: AppColors.lightPrimary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: FutureBuilder<bool?>(
                future: qrController?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                      (snapshot.data! ? Icons.flash_on : Icons.flash_off),
                      color: AppColors.lightSecondary,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              onPressed: () async {
                await qrController?.toggleFlash();
                setState(() {});
              },
            ),
            IconButton(
              icon: FutureBuilder(
                future: qrController?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return const Icon(Icons.switch_camera,
                        color: AppColors.lightSecondary);
                  } else {
                    return Container();
                  }
                },
              ),
              onPressed: () async {
                await qrController?.flipCamera();
                setState(() {});
              },
            ),
          ],
        ),
      );

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }
}
