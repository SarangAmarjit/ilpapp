import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

class BarcodeScannerScreen2 extends StatefulWidget {
  const BarcodeScannerScreen2({super.key});

  @override
  State<BarcodeScannerScreen2> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen2> {

  String barcode = 'Tap  to scan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Scan Barcode'),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AiBarcodeScanner(borderLength: 50,
                      showSuccess: true,
                      successColor: Colors.green,
                      onDispose: () {
                        /// This is called when the barcode scanner is disposed.
                        /// You can write your own logic here.
                        debugPrint("Barcode scanner disposed!");
                      },
                      hideGalleryButton: false,
                      controller: MobileScannerController(detectionSpeed: DetectionSpeed.normal),
                      onDetect: (BarcodeCapture capture) {
                        /// The row string scanned barcode value
                        final String? scannedValue =
                            capture.barcodes.first.rawValue;
                        setState(() {
                          barcode = scannedValue!;
                        });
                        Navigator.pop(context);

                        // /// The `Uint8List` image is only available if `returnImage` is set to `true`.
                        // final Uint8List? image = capture.image;
                        // debugPrint("Barcode image: $image");

                        // /// row data of the barcode
                        // final Object? raw = capture.raw;
                        // debugPrint("Barcode raw: $raw");

                        // /// List of scanned barcodes if any
                        // final List<Barcode> barcodes = capture.barcodes;
                        // debugPrint("Barcode list: $barcodes");
                      },
                      // validator: (value) {
                      //   if (value.barcodes.isEmpty) {
                      //     return false;
                      //   }
                      //   if (!(value.barcodes.first.rawValue
                      //           ?.contains('flutter.dev') ??
                      //       false)) {
                      //     return false;
                      //   }
                      //   return true;
                      // },
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(barcode),
            ),
          ],
        ),
      ),
    );
  }
}
