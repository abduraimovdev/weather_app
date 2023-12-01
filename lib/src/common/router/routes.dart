import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/features/main/bloc/main_bloc.dart';
import 'package:weather_app/src/features/main/screens/add_card/bloc/add_card_bloc.dart';
import 'package:weather_app/src/features/main/screens/add_card/screens/add_card_screen.dart';
import 'package:weather_app/src/features/main/screens/home/bloc/weather_bloc.dart';
import 'package:weather_app/src/features/main/screens/home/screens/detail/screens/detail_screen.dart';
import 'package:weather_app/src/features/main/screens/main_screen.dart';

import '../../features/main/screens/home/data/models/daily_weather.dart';
import '../../features/main/screens/home/data/models/hourly_weather.dart';
import '../../features/splash/screens/splash_screen.dart';
import '../dependecies/dependency_injection.dart';
import '../util/snack_bar.dart';
import 'not_found_route.dart';

part 'routes_config.dart';

class AppRouter {
  const AppRouter._();

  static void showNetworkNotConnected() => showSnackBar(
        _rootNavigatorKey.currentContext!,
        'No Internet Connection',
        content: 'Please check your internet connection!',
      );

  static final router = GoRouter(
    // initialLocation: ($storage.getBool(StorageKeys.startPassed.key) ?? false) ? AppRoutes.start : AppRoutes.home,
    initialLocation: '/',
    restorationScopeId: 'app_router',
    navigatorKey: _rootNavigatorKey,
    errorBuilder: (context, state) => const NotFoundScreen(),
    routes: <RouteBase>[
      GoRoute(
        name: AppRouteNames.start,
        path: AppRoutes.start,
        pageBuilder: (context, state) => _customPageTransition<void>(
          context: context,
          state: state,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.main,
        path: AppRoutes.main,
        pageBuilder: (context, state) => _customPageTransition<void>(
          context: context,
          state: state,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (BuildContext context) => $sl<MainBloc>()),
              BlocProvider(
                create: (BuildContext context) => $sl<WeatherBloc>()
                  ..add(const WeatherSetCurrentLocationEvent()),
              ),
            ],
            child: const MainScreen(),
          ),
        ),
        routes: [
          GoRoute(
              name: AppRouteNames.detail,
              path: AppRoutes.detail,
              pageBuilder: (context, state) {
                DailyWeather? dailWeather;
                HourlyWeather? hourlyWeather;
                if (state.extra is DailyWeather) {
                  dailWeather = state.extra as DailyWeather;
                }
                if (state.extra is HourlyWeather) {
                  hourlyWeather = state.extra as HourlyWeather;
                }
                return _customPageTransition<void>(
                  context: context,
                  state: state,
                  child: BlocProvider(
                    create: (BuildContext context) => $sl<AddCardBloc>(),
                    child: DetailScreen(
                      dWeather: dailWeather,
                      hWeather: hourlyWeather,
                    ),
                  ),
                );
              }),
          GoRoute(
            name: AppRouteNames.addCard,
            path: AppRoutes.addCard,
            pageBuilder: (context, state) => _customPageTransition<void>(
              context: context,
              state: state,
              child: BlocProvider(
                create: (BuildContext context) => $sl<AddCardBloc>(),
                child: const AddCardScreen(),
              ),
            ),
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage _customPageTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) =>
      CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
}
