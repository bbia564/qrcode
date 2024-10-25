import 'package:get/get.dart';

import 'do_code_show_logic.dart';

class DoCodeShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoCodeShowLogic());
  }
}
