import 'package:get/get.dart';

import 'scan_records_logic.dart';

class ScanRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanRecordsLogic());
  }
}
