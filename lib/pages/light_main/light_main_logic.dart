import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:light_color/main.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:styled_widget/styled_widget.dart';

class LightMainLogic extends GetxController {
  int colorType = 0;
  double light = 0.3;
  double exitTime = double.infinity;
  var timeIndex = 0;

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (exitTime == double.infinity) {
        return;
      }
      exitTime -= 1;
      if (exitTime == 0) {
        _timer?.cancel();
        _timer = null;
        exitTime = double.infinity;
        exit(0);
      }
    });
  }

  void showColorSelect(BuildContext context) {
    double hereLight = light;
    var hereColorType = colorType;
    Get.bottomSheet(Container(
      width: double.infinity,
      height: 400,
      padding: const EdgeInsets.all(20),
      child: SafeArea(
          child: GetBuilder<LightMainLogic>(
              id: 'light',
              builder: (_) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: <Widget>[
                    const Text(
                      'Light intensity',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Slider(
                        activeColor: primaryColor,
                        inactiveColor: const Color(0xffefefef),
                        max: 1,
                        value: hereLight,
                        onChanged: (v) {
                          hereLight = v;
                          update(['light']);
                        }),
                    const SizedBox(height: 10),
                    const Text(
                      'Choose color',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12),
                        itemCount: colorList.length,
                        itemBuilder: (_, index) {
                          return LayoutBuilder(builder: (_, max) {
                            return Container(
                              child: <Widget>[
                                Visibility(
                                    visible: hereColorType == index,
                                    child: const Icon(
                                      Icons.check_circle_sharp,
                                      size: 20,
                                      color: Colors.black,
                                    ))
                              ].toRow(
                                  mainAxisAlignment: MainAxisAlignment.center),
                            )
                                .decorated(
                                    border: Border.all(color: Colors.black),
                                    color: colorList[index],
                                    borderRadius:
                                        BorderRadius.circular(max.maxWidth / 2))
                                .gestures(onTap: () {
                              hereColorType = index;
                              update(['light']);
                            });
                          });
                        }),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                        .decorated(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15))
                        .gestures(onTap: () {
                      light = hereLight;
                      colorType = hereColorType;
                      update(['light']);
                      Get.back();
                      update(['all']);
                    }),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Version"),
                          Text("1.0.0")
                        ],
                      ),
                    )
                        .decorated(
                            color: const Color(0xfff4f6fa),
                            borderRadius: BorderRadius.circular(15))

                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                );
              })),
    ).decorated(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))));
  }

  Widget _item(int index) {
    final titles = ['10 minutes', '20 minutes', '30 minutes', 'Custom'];
    return Expanded(
        child: Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: <Widget>[
        timeIndex != index
            ? const Icon(
                Icons.check_box_outline_blank,
                size: 16,
                color: Color(0xff707070),
              )
            : const Icon(
                Icons.check_circle_rounded,
                size: 16,
                color: Colors.black,
              ),
        const SizedBox(width: 10),
        Text(
          titles[index],
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ].toRow(),
    )
            .decorated(
                borderRadius: BorderRadius.circular(23),
                border: Border.all(
                    color: timeIndex == index
                        ? const Color(0xff707070)
                        : const Color(0xffededed)))
            .gestures(onTap: () {
      timeIndex = index;
      update(['time']);
    }));
  }

  showTimeSelect(BuildContext context) {
    double hereExitTime = exitTime;
    Get.bottomSheet(
      Container(
        width: double.infinity,
        height: 400,
        padding: const EdgeInsets.all(20),
        child: SafeArea(
            child: GetBuilder<LightMainLogic>(
                id: 'time',
                builder: (_) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: <Widget>[
                      const Text(
                        'Set time',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      <Widget>[
                        _item(0),
                        const SizedBox(
                          width: 10,
                        ),
                        _item(1)
                      ].toRow(),
                      const SizedBox(height: 10),
                      <Widget>[
                        _item(2),
                        const SizedBox(
                          width: 10,
                        ),
                        _item(3)
                      ].toRow(),
                      const SizedBox(height: 15),
                      Visibility(
                          visible: timeIndex == 3,
                          child: SizedBox(
                            height: 150,
                            child: DateTimePickerWidget(
                                dateFormat: 'HH:mm',
                                initDateTime: DateTime(DateTime.now().year,
                                    DateTime.now().month, DateTime.now().day,2),
                                pickerTheme: const DateTimePickerTheme(
                                    showTitle: false,
                                    cancel: null,
                                    confirm: null),
                                onChange: (dateTime, str) {
                                  hereExitTime = dateTime.hour * 60 * 60 +
                                      dateTime.minute * 60;
                                  update(['time']);
                                }),
                          )),
                      Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )
                          .decorated(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(15))
                          .gestures(onTap: () {
                        if (timeIndex == 3) {
                          exitTime = hereExitTime;
                        } else {
                          hereExitTime = 10 * (timeIndex + 1) * 60;
                          exitTime = hereExitTime;
                        }
                        update(['time']);
                        update(['all']);
                        startTimer();
                        Get.back();
                      }),
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  );
                })),
      ).decorated(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    );
  }

  aboutLightUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 72,
        height: 72,
      ),
      children: [
        const Text("""We can provide you with color debugging"""),
      ],
      context: context,
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
  }
}
