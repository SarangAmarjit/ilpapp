import 'package:flutter/material.dart';
import 'package:ilpapp/model/scannermodel.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:convert'; // For JSON parsing


class QRScannerExample extends StatefulWidget {
  @override
  _QRScannerExampleState createState() => _QRScannerExampleState();
}

class _QRScannerExampleState extends State<QRScannerExample> {
  QrScannerModel? scannedModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display scanned data
            scannedModel != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Permit Type: ${scannedModel!.permitType}"),
                        Text("Permit No: ${scannedModel!.permitNo}"),
                        Text("Applicant Name: ${scannedModel!.applicantName}"),
                        Text("Applicant Parent: ${scannedModel!.applicantParent}"),
                        Text("ID No: ${scannedModel!.idNo}"),
                        Text("Date of Issue: ${scannedModel!.dateOfIssue}"),
                        Text("Valid Upto: ${scannedModel!.validUpto}"),
                        Text("Place of Stay: ${scannedModel!.placeOfStay}"),
                        Text("HS: ${scannedModel!.hs}"),
                      ],
                    ),
                  )
                : Text(
                    'No data scanned yet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
            SizedBox(height: 20),
            // Scan button
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScannerScreen()),
                );
                if (result != null) {
                  try {
                    // Parse the JSON data into a QrScannerModel
                    final parsedData = qrScannerModelFromJson(result);
                    setState(() {
                      scannedModel = parsedData; // Update the model
                    });
                  } catch (e) {
                    // Handle invalid JSON
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid QR Code Data')),
                    );
                  }
                }
              },
              child: Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}


class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.green,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.dispose(); // Stop the camera after scanning
      Navigator.pop(context, scanData.code); // Pass the scanned raw data
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
