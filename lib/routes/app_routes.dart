part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home        = _Paths.home;
  static const edit        = _Paths.edit;
  static const main        = _Paths.main;
  static const search      = _Paths.search;
  static const dichVu      = _Paths.dichVu;
  static const chatBot     = _Paths.chatBot;
  static const newsDetail  = _Paths.newsDetail;
  static const allServices = _Paths.allServices;
}

abstract class _Paths {
  static const home    = '/home';
  static const edit    = '/edit';
  static const main    = '/main';
  static const search  = '/search';
  static const dichVu  = '/dichvu';
  static const chatBot = '/chatbot';
  static const newsDetail = '/news_detail';
  static const allServices = '/all_services';
}
