part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const HISTORY = _Paths.HISTORY;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const HISTORY = '/history';
}
