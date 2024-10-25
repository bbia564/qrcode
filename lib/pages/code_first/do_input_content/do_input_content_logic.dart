import 'dart:typed_data';

import 'package:barcode_image/barcode_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image/image.dart';

class DoInputContentLogic extends GetxController {
  int type = Get.arguments;
  final titles = ['QR Code', 'Code-39', 'Code-128', 'EAN-13'];
  String content = '';

  void create() {
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the content');
      return;
    }
    try {
      final image = Image(width: 280, height: 280);
      fill(image, color: ColorRgb8(255, 255, 255));
      late Barcode barcode;
      switch (type) {
        case 0:
          barcode = Barcode.qrCode();
          break;
        case 1:
          barcode = Barcode.code39();
          break;
        case 2:
          barcode = Barcode.code128();
          break;
        case 3:
          barcode = Barcode.ean13();
          break;
      }
      drawBarcode(image, barcode, content, font: arial24);
      Get.toNamed('/do_code_show',
          arguments: type, parameters: {'content': content});
    } catch (e) {
      Fluttertoast.showToast(msg: 'Code generation failure');
      return;
    }

  }
}
