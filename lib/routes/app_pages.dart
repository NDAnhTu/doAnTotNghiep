import 'package:get/get.dart';
import '../modules/all_services/binding/all_services_binding.dart';
import '../modules/all_services/view/all_services_view.dart';
import '../modules/dich_vu/binding/dichvu_binding.dart';
import '../modules/dich_vu/view/dichvu_view.dart';
import '../modules/edit_page/binding/edit_binding.dart';
import '../modules/edit_page/view/edit_view.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_view.dart';
import '../modules/main/binding/main_binding.dart';
import '../modules/main/view/main_view.dart';
import '../modules/search/binding/search_binding.dart';
import '../modules/search/view/search_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const home = Routes.home;
  static const main = Routes.main;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: const [],
    ),
    GetPage(
      name: _Paths.dichvu,
      page: () => DichVuView(),
      binding: DichVuBinding(),
      children: const [],
    ),
    GetPage(
      name: _Paths.main,
      page: () => MainView(),
      binding: MainBinding(),
      children: const [],
    ),
    GetPage(
      name: _Paths.search,
      page: () => SearchView(),
      binding: SearchBinding(),
      transition: Transition.cupertinoDialog,
      children: const [],
    ),
    GetPage(
      name: _Paths.allServices,
      page: () => AllServicesView(),
      binding: AllServicesBinding(),
      transition: Transition.cupertinoDialog,
      children: const [],
    ),
    GetPage(
      name: _Paths.edit,
      page: () => EditView(),
      binding: EditBinding(),
      transition: Transition.cupertinoDialog,
      children: const [],
    ),
  ];
}
