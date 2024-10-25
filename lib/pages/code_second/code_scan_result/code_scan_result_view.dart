import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qrcode/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'code_scan_result_logic.dart';

class CodeScanResultPage extends GetView<CodeScanResultLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: GetBuilder<CodeScanResultLogic>(builder: (_) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    Text(
                      controller.result,
                      style: const TextStyle(fontSize: 14),
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Copy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                        .decorated(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10))
                        .marginSymmetric(vertical: 15)
                        .gestures(onTap: () async {
                      Clipboard.setData(ClipboardData(text: controller.result));
                      Fluttertoast.showToast(msg: 'Copy success');
                    })
                  ].toColumn(),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10))
              ].toColumn(),
            );
          }).marginAll(15)),
        ));
  }
}
