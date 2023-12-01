part of './theme.dart';

final class AppSvg {
  const AppSvg._();

  static const String currentLocation = "assets/svg/current_location.svg";
  static const String day = "assets/svg/day.svg";
  static const String humidity = "assets/svg/humidity.svg";
  static const String night = "assets/svg/night.svg";
  static const String pressure = "assets/svg/pressure.svg";
  static const String temperature = "assets/svg/temperature.svg";
  static const String weather = "assets/svg/weather.svg";
  static const String wind = "assets/svg/wind.svg";
}

extension AppSvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
    BoxFit? fit,
  }) =>
      SvgPicture.asset(
        this,
        color: color,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      );
}
