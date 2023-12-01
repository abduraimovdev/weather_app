import 'package:flutter/material.dart';

import '../dependecies/app_dependencies.dart';
import '../localization/localization.dart';
import '../router/routes.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Weather App',
        restorationScopeId: 'material_app',
        debugShowCheckedModeBanner: false,
        // TODO(--Localization--)
        locale: AppScope.of(context).locale,
        localizationsDelegates: Localization.localizationsDelegates,
        supportedLocales: Localization.supportedLocales,

        // TODO(--Theme--)
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: AppScope.of(context).themeMode,

        // TODO(--AppRouter--)
        routerConfig: AppRouter.router,
      );
}
