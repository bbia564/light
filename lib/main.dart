import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_color/pages/light_main/light_main_binding.dart';
import 'package:light_color/pages/light_main/light_main_view.dart';
import 'package:light_color/pages/no_network/no_network_binding.dart';
import 'package:light_color/pages/no_network/no_network_view.dart';

Color primaryColor = const Color(0xffffcd93);
Color bgColor = const Color(0xffd9d9d9);

List<Color> colorList = const [
  Color(0xfff83232),
  Color(0xfff0e0c6),
  Color(0xff2f8fff),
  Color(0xff2cc54e),
  Color(0xffeb6161),
  Color(0xffffff00),
  Color(0xffd9d9d9),
  Color(0xff93ffd5),
  Color(0xff93deff),
  Color(0xffff9393),
  Color(0xff685cff),
  Color(0xfff793ff),
  Color(0xff93c9ff),
  Color(0xffffffff),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Lights,
      initialRoute: '/main',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Lights = [
  GetPage(
      name: '/main',
      page: () => const LightMainPage(),
      binding: LightMainBinding()),
  GetPage(
      name: '/not_found',
      page: () => NoNetworkPage(),
      binding: NoNetworkBinding()),
];
