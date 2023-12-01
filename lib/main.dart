import 'dart:async';

import 'package:flutter/material.dart';

import 'src/common/dependecies/app_dependencies.dart';
import 'src/common/widget/app.dart';
import 'src/common/widget/initialize_app.dart';

@pragma('vm:entry-point')
void main([List<String>? args]) => runZoned<Future<void>>(() async {
      await initializeApp();
      runApp(
        const DependencyScope(
          initialModel: AppScope(
            themeMode: ThemeMode.light,
            locale: Locale('en'),
          ),
          child: App(),
        ),
      );
    });
