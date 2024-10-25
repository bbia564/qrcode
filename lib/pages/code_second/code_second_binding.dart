import 'package:get/get.dart';

import 'code_second_logic.dart';

class CodeSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CodeSecondLogic());
  }
}
