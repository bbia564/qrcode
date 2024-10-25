import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/main.dart';
import 'package:qrcode/pages/code_first/code_item.dart';
import 'package:styled_widget/styled_widget.dart';

import 'code_first_logic.dart';

class CodeFirstPage extends GetView<CodeFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manufacture",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            const Text(
              '2D',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff888888),
                  fontWeight: FontWeight.w500),
            ).marginOnly(bottom: 10),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 1,
                itemBuilder: (_, index) {
                  return const CodeItem(title: 'QR Code',type: 0,);
                }),
            const Text(
              '1D',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff888888),
                  fontWeight: FontWeight.w500),
            ).marginSymmetric(vertical: 10),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (_, index) {
                  final titles = ['Code-39','Code-128','EAN-13'];
                  return CodeItem(title: titles[index],type: index+1,);
                })
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
        ).marginAll(15)),
      ),
    );
  }
}
