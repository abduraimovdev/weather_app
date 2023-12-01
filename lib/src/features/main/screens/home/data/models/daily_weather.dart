import 'package:weather_app/src/common/util/extension/date_time_converter.dart';
import 'package:weather_app/src/features/main/screens/home/data/models/temp.dart';

class DailyWeather {
   DateTime? dateTime;
  Temp? temp;
  final int humidity;
  num? pressure;
  num? windSpeed;

  DailyWeather({
    required this.humidity,
    this.dateTime,
    this.temp,
    this.pressure,
    this.windSpeed,
  });

  Map<String, Object?> toJson() {
    return {
      'dateTime': dateTime,
      'temp': temp,
      'humidity': humidity,
      'pressure': pressure,
      'windSpeed': windSpeed,
    };
  }

  factory DailyWeather.fromJson(Map<String, Object?> json) {
    return DailyWeather(
      dateTime: json['dt'] == null
          ? DateTime.now()
          : (json['dt'] as int).fromJson,
      temp: Temp.fromJson(json['temp'] as Map<String, Object?>),
      humidity: json['humidity'] as int,
      pressure: json['pressure'] as int,
      windSpeed: json['wind_speed'] == null ? null : json['wind_speed'] as num,
    );
  }
}
