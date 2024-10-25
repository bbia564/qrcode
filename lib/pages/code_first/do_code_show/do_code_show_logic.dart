import 'dart:typed_data';

import 'package:barcode_image/barcode_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image/image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class DoCodeShowLogic extends GetxController {
  final int type = Get.arguments;
  final String content = Get.parameters['content'] ?? '';
  final titles = ['QR Code', 'Code-39', 'Code-128', 'EAN-13'];

  Uint8List? codeImage;

  void saveImage() async {
    if (codeImage == null) {
      Fluttertoast.showToast(msg: 'Code generation failure');
      return;
    }
    PermissionStatus status = await Permission.storage.status;
    if (status == PermissionStatus.granted) {
      Map result = await ImageGallerySaver.saveImage(codeImage!);
      if (result['isSuccess'] == true) {
        Fluttertoast.showToast(msg: 'Save to album successfully');
        return;
      }
    } else {
      status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        Map result = await ImageGallerySaver.saveImage(codeImage!);
        if (result['isSuccess'] == true) {
          Fluttertoast.showToast(msg: 'Save to album successfully');
          return;
        }
      } else {
        Fluttertoast.showToast(msg: 'Please authorize and try again');
        return;
      }
    }

  }

  @override
  void onInit() async {
    // TODO: implement onInit
    final image = Image(width: 280, height: type == 0 ? 280 : 120);
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
    codeImage = encodePng(image);
    update();
    super.onInit();
  }
}
