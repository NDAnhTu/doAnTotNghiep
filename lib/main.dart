import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_binding.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      themeMode: ThemeMode.system,
      initialRoute: AppPages.main,
      getPages: AppPages.routes,
    );
  }
}
