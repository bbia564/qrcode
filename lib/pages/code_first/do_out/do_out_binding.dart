import 'package:get/get.dart';

import 'do_out_logic.dart';

class DoOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
