import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/main.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../db_code/code_entity.dart';
import 'scan_records_logic.dart';

class ScanRecordsPage extends GetView<ScanRecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Code scanning history',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        actions: [
          const Text(
            'Clean',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ).marginOnly(right: 20).gestures(onTap: (){
            controller.cleanCodeData();
          })
        ],
      ),
      body: Obx(() {
        return controller.list.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: controller.list.length,
                itemBuilder: (_, index) {
                  final entity = controller.list[index];
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: <Widget>[
                      Image.asset(
                        'assets/type${entity.type == CodeType.qrCode ? '0' : '1'}.webp',
                        width: 23,
                        height: 23,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                          child: <Widget>[
                        Text(
                          entity.content,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          entity.timeString,
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
                    ].toRow(),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))
                      .marginOnly(bottom: 10)
                      .gestures(onTap: () {
                    Get.toNamed('/code_scan_result',
                        arguments: entity.content);
                  });
                });
      }),
    );
  }
}
