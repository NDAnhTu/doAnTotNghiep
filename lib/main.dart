import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //theme: ThemeData(
      // scaffoldBackgroundColor:Colors.transparent,
      // appBarTheme: const AppBarTheme(
      //   systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
      //   foregroundColor: Colors.lightBlue,
      //   backgroundColor: Colors.lightBlue,
      //   // brightness: Brightness.dark,
      // ),
      //),
      // title: "CatalogPod",
      // enableLog: true,
      defaultTransition: Transition.rightToLeft,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      themeMode: ThemeMode.system,
      initialRoute: AppPages.home,
      getPages: AppPages.routes,
    );
  }
}
