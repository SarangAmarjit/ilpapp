import 'package:get/get.dart';
import 'package:ilpapp/model/scannermodel.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scancontroller extends GetxController {

    final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );

  // Scanned data
  var scannedModel = Rxn<QrScannerModel>();
  // Stream<BarcodeCapture>? barcode;
  // Method to start QR scan
  Future<void> startQRScan(Stream<BarcodeCapture> barcode) async {

      barcode.listen((event) {
            try {
          
            
    if (event.barcodes.first.displayValue!=null &&  event.barcodes.first.displayValue!.isNotEmpty) {
      // Ensure it's not canceled
      try {
        // Parse the JSON data into QrScannerModel
        final parsedData = qrScannerModelFromJson(event.barcodes.first.displayValue!);
        scannedModel.value = parsedData; // Update the scanned data
      } catch (e) {
        // Handle invalid JSON
        Get.snackbar(
          "Invalid Data",
          "The scanned QR code contains invalid data.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }}on Exception{

    }
  
      },);
    // String barcodeScanRes;

    // try {
    //   barcodeScanRes = await scanBarcode(
    //     '#ff6666', // Scanner overlay color
    //     'Cancel', // Cancel button text
    //     true, // Show flash icon
    //     ScanMode.QR, // Set scan mode to QR
    //   );
    // } on PlatformException {
    //   barcodeScanRes = 'Failed to start QR scanner.';
    //   Get.snackbar("Error", "Failed to start QR scanner.",
    //       snackPosition: SnackPosition.BOTTOM);
    //   return;
    // }

    // if (barcodeScanRes.isNotEmpty && barcodeScanRes != '-1') {
    //   // Ensure it's not canceled
    //   try {
    //     // Parse the JSON data into QrScannerModel
    //     final parsedData = qrScannerModelFromJson(barcodeScanRes);
    //     scannedModel.value = parsedData; // Update the scanned data
    //   } catch (e) {
    //     // Handle invalid JSON
    //     Get.snackbar(
    //       "Invalid Data",
    //       "The scanned QR code contains invalid data.",
    //       snackPosition: SnackPosition.BOTTOM,
    //     );
    //   }
    // }
  }

  void closecontroller()async{
   controller.dispose();
  }
}
