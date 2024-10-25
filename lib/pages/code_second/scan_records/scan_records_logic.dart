import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/db_code/code_entity.dart';
import 'package:qrcode/db_code/db_code.dart';

class ScanRecordsLogic extends GetxController {

  DBCode dbCode = Get.find<DBCode>();

  var list = <CodeEntity>[].obs;

  void getScanRecords() async {
    list.value = await dbCode.getCodeAllData();
  }

  cleanCodeData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbCode.cleanCodeData();
            getScanRecords();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getScanRecords();
    super.onInit();
  }

}
