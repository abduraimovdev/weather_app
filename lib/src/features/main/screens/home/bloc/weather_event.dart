part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherSetTypeEvent extends WeatherEvent {
  final WeatherType type;

  const WeatherSetTypeEvent({required this.type});

  @override
  List<Object?> get props => [type];
}

class WeatherGetEvent extends WeatherEvent {
  const WeatherGetEvent();

  @override
  List<Object?> get props => [];
}

class WeatherSetCurrentLocationEvent extends WeatherEvent {
  const WeatherSetCurrentLocationEvent();

  @override
  List<Object?> get props => [];
}

class WeatherGetCodeEvent extends WeatherEvent {
  final double latitude;
  final double longitude;

  const WeatherGetCodeEvent({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];
}

enum WeatherType {
  daily,
  hourly,
}


