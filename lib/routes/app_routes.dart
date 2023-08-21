part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home   = _Paths.home;
  static const main   = _Paths.main;
  static const search = _Paths.search;
  static const dichvu = _Paths.dichvu;
}

abstract class _Paths {
  static const home   = '/home';
  static const main   = '/main';
  static const search = '/search';
  static const dichvu = '/dichvu';
}
