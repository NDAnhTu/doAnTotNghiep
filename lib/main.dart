import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petcare/theme/fonts.dart';
import 'app_binding.dart';
import 'routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: buildTheme(Brightness.light),
      defaultTransition: Transition.rightToLeft,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      themeMode: ThemeMode.light,
      initialRoute: AppPages.main,
      getPages: AppPages.routes,
    );
  }
}
