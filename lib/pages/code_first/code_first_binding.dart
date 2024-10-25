import 'package:get/get.dart';

import 'code_first_logic.dart';

class CodeFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CodeFirstLogic());
  }
}
