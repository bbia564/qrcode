import 'package:get/get.dart';

class CodeScanResultLogic extends GetxController {

  String result = Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    super.onInit();
  }

}
