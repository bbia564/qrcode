import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/main.dart';
import 'package:qrcode/pages/code_first/do_input_content/code_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'do_input_content_logic.dart';

class DoInputContentPage extends GetView<DoInputContentLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.titles[controller.type],
              style: const TextStyle(color: Colors.white)),
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
                    Text(
                      'Manufacture ${controller.titles[controller.type]}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    CodeTextField(
                        hintText:
                            controller.type == 0 ? 'Fill in the text or website address' : 'Fill in information',
                        maxLength: 100,
                        maxLines: 5,
                        value: controller.content,
                        onChange: (value) {
                          controller.content = value;
                        }),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Create',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    )
                        .decorated(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15))
                        .marginOnly(top: 20)
                        .gestures(onTap: () {
                      controller.create();
                    })
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).marginAll(15),
          ),
        ));
  }
}
