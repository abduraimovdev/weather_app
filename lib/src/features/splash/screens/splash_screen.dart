import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/common/router/routes.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.pushReplacementNamed(AppRouteNames.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.lightBlue,
      body: Center(
        child: AppSvg.weather.svg(),
      ),
    );
  }
}
