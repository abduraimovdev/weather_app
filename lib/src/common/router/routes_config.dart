part of 'routes.dart';

final class AppRoutes {
  const AppRoutes._();

  /// Authentication

  static const start = '/';
  static const main = '/main';
  static const detail = 'detail';
  static const addCard = 'add_card';



}

final class AppRouteNames {
  const AppRouteNames._();
  static const start = 'start';

  static const main = 'main';
  static const detail = 'detail';
  static const addCard = 'add_card';

}

final class AppRouteQueries {
}

// final _registrationShellNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorKey = GlobalKey<NavigatorState>();

class CustomRouteObserver extends NavigatorObserver {

}
