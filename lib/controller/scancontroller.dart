import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:ilpapp/model/scannermodel.dart';

class Scancontroller extends GetxController {
  // Scanned data
  var scannedModel = Rxn<QrScannerModel>();

  // Method to start QR scan
  Future<void> startQRScan() async {
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
      Get.snackbar("Error", "Failed to start QR scanner.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (barcodeScanRes.isNotEmpty && barcodeScanRes != '-1') {
      // Ensure it's not canceled
      try {
        // Parse the JSON data into QrScannerModel
        final parsedData = qrScannerModelFromJson(barcodeScanRes);
        scannedModel.value = parsedData; // Update the scanned data
      } catch (e) {
        // Handle invalid JSON
        Get.snackbar(
          "Invalid Data",
          "The scanned QR code contains invalid data.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
