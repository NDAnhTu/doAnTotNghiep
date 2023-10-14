part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home        = _Paths.home;
  static const edit        = _Paths.edit;
  static const main        = _Paths.main;
  static const search      = _Paths.search;
  static const dichvu      = _Paths.dichvu;
  static const chatbot     = _Paths.chatbot;
  static const allServices = _Paths.allServices;
}

abstract class _Paths {
  static const home    = '/home';
  static const edit    = '/edit';
  static const main    = '/main';
  static const search  = '/search';
  static const dichvu  = '/dichvu';
  static const chatbot = '/chatbot';
  static const allServices = '/all_services';
}
