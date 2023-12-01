import 'package:weather_app/src/common/util/extension/date_time_converter.dart';

class HourlyWeather {
  final DateTime? dateTime;
  final num? temp;

  final num? humidity;
  final num? pressure;
  final num? windSpeed;

  const HourlyWeather({
    this.dateTime,
    this.temp,
    this.humidity,
    this.pressure,
    this.windSpeed,
  });

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'temp': temp,
      'humidity': humidity,
      'pressure': pressure,
      'windSpeed': windSpeed,
    };
  }

  factory HourlyWeather.fromJson(Map<String, Object?> json) {
    return HourlyWeather(
      dateTime: json['dt'] == null
          ? DateTime.now()
          : (json['dt'] as int).fromJson,
      temp: json['temp'] as num,
      humidity: json['humidity'] as num,
      pressure: json['pressure'] as num,
      windSpeed: json['wind_speed'] == null ? null : json['wind_speed'] as num,
    );
  }
}
