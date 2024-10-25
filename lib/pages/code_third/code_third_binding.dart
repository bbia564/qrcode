import 'package:get/get.dart';

import 'code_third_logic.dart';

class CodeThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CodeThirdLogic());
  }
}
