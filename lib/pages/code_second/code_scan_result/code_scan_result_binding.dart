import 'package:get/get.dart';

import 'code_scan_result_logic.dart';

class CodeScanResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CodeScanResultLogic());
  }
}
