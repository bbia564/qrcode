import 'package:get/get.dart';

import 'do_input_content_logic.dart';

class DoInputContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoInputContentLogic());
  }
}
