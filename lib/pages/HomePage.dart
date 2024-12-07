import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ilpapp/model/scannermodel.dart'; // Assuming this is your model
import 'dart:convert'; // For JSON parsing

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QrScannerModel? scannedModel;

  Future<void> _startQRScan() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Scanner overlay color
        'Cancel', // Cancel button text
        true, // Show flash icon
        ScanMode.QR, // Set scan mode to QR
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to start QR scanner.';
    }

    if (barcodeScanRes.isNotEmpty && barcodeScanRes != '-1') {
      // Ensure it's not canceled
      try {
        // Parse the JSON data into QrScannerModel
        final parsedData = qrScannerModelFromJson(barcodeScanRes);
        setState(() {
          scannedModel = parsedData; // Update the model
        });
      } catch (e) {
        // Handle invalid JSON
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('The scanned QR code contains invalid data.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ILP Card Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title and Instructions
            const Text(
              'Verify Your Card',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Tap the button below to scan the QR code on the card and verify its authenticity.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30.0),
            GestureDetector(onTap: _startQRScan,
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/scan.gif',
                    ),
                  ),
                ),
              ),
            ),
            // Scan Button
            // ElevatedButton.icon(
            //   onPressed: _startQRScan,
            //   icon: const Icon(Icons.qr_code_scanner, size: 24.0),
            //   label: const Text('Start QR Scan'),
            //   style: ElevatedButton.styleFrom(
            //     padding: const EdgeInsets.symmetric(
            //         horizontal: 24.0, vertical: 12.0),
            //     textStyle: const TextStyle(fontSize: 18.0),
            //   ),
            // ),
            const SizedBox(height: 30.0),

            // Scanned Data Display
            scannedModel != null
                ? Card(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Scanned Data:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          Text("Permit Type: ${scannedModel!.permitType}"),
                          Text("Permit No: ${scannedModel!.permitNo}"),
                          Text(
                              "Applicant Name: ${scannedModel!.applicantName}"),
                          Text(
                              "Applicant Parent: ${scannedModel!.applicantParent}"),
                          Text("ID No: ${scannedModel!.idNo}"),
                          Text("Date of Issue: ${scannedModel!.dateOfIssue}"),
                          Text("Valid Upto: ${scannedModel!.validUpto}"),
                          Text("Place of Stay: ${scannedModel!.placeOfStay}"),
                          Text("HS: ${scannedModel!.hs}"),
                        ],
                      ),
                    ),
                  )
                : Text(
                    'No data scanned yet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                  ),
          ],
        ),
      ),
    );
  }
}
