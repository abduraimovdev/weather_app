import 'daily_weather.dart';
import 'hourly_weather.dart';

class WeatherResponse {
  final HourlyWeather? current;
  final List<HourlyWeather>? hourly;
  final List<DailyWeather>? daily;

  const WeatherResponse({
    required this.daily,
    required this.current,
    required this.hourly,
  });

  Map<String, Object?> toJson() {
    return {
      'current': current,
      'hourly': hourly,
      'daily': daily,
    };
  }

  factory WeatherResponse.fromJson(Map<String, Object?> json) {
    return WeatherResponse(
      current: HourlyWeather.fromJson(json['current'] as Map<String, Object?>),
      hourly: (json['hourly'] as List).map((e) => HourlyWeather.fromJson(e)).toList(),
      daily: (json['daily'] as List).map((e) => DailyWeather.fromJson(e)).toList(),
    );
  }
}
