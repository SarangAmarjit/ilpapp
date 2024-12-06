import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String? scannedBarcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          scannedBarcode != null
              ? const SizedBox()
              : SizedBox(
                  height: 400,
                  child: Expanded(
                    child: MobileScanner(
                      controller: MobileScannerController(
                          detectionSpeed: DetectionSpeed.unrestricted),
                      onDetect: (
                        barcode,
                      ) {
                        setState(() {
                          scannedBarcode = barcode.barcodes.first.displayValue!;
                        });

                        if (scannedBarcode != null) {
                          // Stop scanning after successful detection
                          MobileScannerController().stop();
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Scanned Barcode'),
                              content: Text(scannedBarcode ?? 'No data'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
          if (scannedBarcode != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Scanned: $scannedBarcode',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
