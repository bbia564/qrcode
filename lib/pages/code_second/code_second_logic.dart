import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode/db_code/db_code.dart';

import '../../db_code/code_entity.dart';

class CodeSecondLogic extends GetxController {

  DBCode dbCode = Get.find<DBCode>();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  final MobileScannerController mobileScannerController = MobileScannerController(
    torchEnabled: true,
  );

  void onQRViewCreated(QRViewController contro) {
    qrViewController = contro;
    contro.scannedDataStream.listen((scanData) async {
      if (scanData.code == null) {
        return;
      }
      final scanDataNum = int.tryParse(scanData.code!) ?? 0;
      final codeEntity = CodeEntity(
        id: 0,
        content: scanData.code!,
        createTime: DateTime.now(),
        type: scanDataNum > 0 ? CodeType.barCode : CodeType.qrCode,
        isScan: 1,
      );
      await dbCode.insertCode(codeEntity);
      Get.toNamed('/code_scan_result',arguments: scanData.code);
    });
  }

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imagePath = pickedFile.path;
        final BarcodeCapture? barcodes = await mobileScannerController.analyzeImage(
          imagePath,
        );
        final codeResult = barcodes?.barcodes.first.rawValue;
        if (codeResult != null) {
          final scanDataNum = int.tryParse(codeResult) ?? 0;
          final codeEntity = CodeEntity(
            id: 0,
            content: codeResult,
            createTime: DateTime.now(),
            type: scanDataNum > 0 ? CodeType.barCode : CodeType.qrCode,
            isScan: 1,
          );
          await dbCode.insertCode(codeEntity);
          Get.toNamed('/code_scan_result',arguments: codeResult);
        } else {
          Fluttertoast.showToast(msg: 'No useful information was scanned');
          return;
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

}
