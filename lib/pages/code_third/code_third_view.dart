import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'code_third_logic.dart';

class CodeThirdPage extends GetView<CodeThirdLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Code scanning history', 'About us',];
    return Container(
      height: 40,
      color: Colors.transparent,
      child: <Widget>[
        Expanded(
          child: Text(
            titles[index],
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        index == 0 ? Icon(
          Icons.keyboard_arrow_right,
          size: 21,
          color: Colors.grey.withOpacity(0.7),
        ) : const Text('1.0.0').paddingOnly(right: 8)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          Get.toNamed('/scan_records');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
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
            Container(
              padding: const EdgeInsets.all(15),
              child: <Widget>[
                _item(0, context),
                _item(1, context),
              ].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(10))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
