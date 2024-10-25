import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'code_second_logic.dart';

class CodeSecondPage extends StatefulWidget {
  const CodeSecondPage({Key? key}) : super(key: key);

  @override
  State<CodeSecondPage> createState() => _CodeSecondPageState();
}

class _CodeSecondPageState extends State<CodeSecondPage> {
  CodeSecondLogic controller = Get.find<CodeSecondLogic>();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      controller.qrViewController!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan code',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        leading: const Icon(
          Icons.image,
          size: 28,
          color: Colors.white,
        ).marginOnly(left: 20).gestures(onTap: () {
          controller.imageSelected();
        }),
        actions: [
          const Text(
            'Records',
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/scan_records');
          })
        ],
      ),
      body: GetBuilder<CodeSecondLogic>(builder: (_) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: QRView(
                      key: controller.qrKey,
                      onQRViewCreated: controller.onQRViewCreated)),
              const Text(
                'Automatic recognition of QR code, bar code',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ).marginOnly(bottom: 15),
            ],
          ),
        );
      }),
    );
  }
}
