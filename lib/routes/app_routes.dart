part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home; //1
  static const notice = _Paths.notice; //3
  static const search = _Paths.search; //5
  static const category = _Paths.category; //4
  static const bookView = _Paths.bookView; //6
  static const bookShelf = _Paths.bookShelf; //6
  static const bookDetail = _Paths.bookDetail; //2
  static const fullCategory = _Paths.fullCategory; //7
}

abstract class _Paths {
  static const home = '/home';
  static const notice = '/notice';
  static const search = '/search';
  static const category = '/category';
  static const bookView = '/book-view';
  static const bookShelf = '/book-shelf';
  static const bookDetail = '/book-detail';
  static const fullCategory = '/full-category';
}
