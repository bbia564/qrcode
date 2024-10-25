import 'package:get/get.dart';

import '../code_first/code_first_logic.dart';
import '../code_second/code_second_logic.dart';
import '../code_third/code_third_logic.dart';
import 'code_tab_logic.dart';

class CodeTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CodeTabLogic());
    Get.lazyPut(() => CodeFirstLogic());
    Get.lazyPut(() => CodeSecondLogic());
    Get.lazyPut(() => CodeThirdLogic());
  }
}
