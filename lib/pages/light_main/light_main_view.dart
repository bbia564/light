import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'light_main_logic.dart';

class LightMainPage extends StatefulWidget {
  const LightMainPage({Key? key}) : super(key: key);

  @override
  State<LightMainPage> createState() => _LightMainPageState();
}

class _LightMainPageState extends State<LightMainPage> {

  final controller = Get.put(LightMainLogic());

  void checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.toNamed('/not_found');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkNetwork();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LightMainLogic>(id: 'all',builder: (_) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.bottomCenter,
          child: SafeArea(
              child: <Widget>[
                Image.asset(
                  'assets/icon0.webp',
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                ).gestures(onTap: () {
                  controller.showColorSelect(context);
                }),
                const SizedBox(width: 25,),
                Image.asset(
                  'assets/icon1.webp',
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                ).gestures(onTap: () {
                  controller.showTimeSelect(context);
                }),
              ].toRow(mainAxisAlignment: MainAxisAlignment.center)),
        ).decorated(
            color: colorList[controller.colorType].withOpacity(controller.light));
      }),
    );
  }
}

