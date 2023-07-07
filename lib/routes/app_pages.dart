import 'package:get/get.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const home = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: const [],
    )
  ];
}
