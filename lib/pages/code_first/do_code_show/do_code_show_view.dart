import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'do_code_show_logic.dart';

class DoCodeShowPage extends GetView<DoCodeShowLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.titles[controller.type],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: controller.codeImage == null
                      ? const Center(
                          child: Text('Code generation failure'),
                        )
                      : Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.memory(
                            controller.codeImage!,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
                    .decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10))
                    .marginSymmetric(vertical: 30)
                    .gestures(onTap: () {
                  controller.saveImage();
                })
              ].toColumn(),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(10))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
