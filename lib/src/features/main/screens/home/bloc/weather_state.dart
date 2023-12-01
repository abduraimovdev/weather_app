part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  error,
}

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherType type;
  final String errorMessage;
  final WeatherResponse? data;
  final GeoCode geoCode;

  const WeatherState({
    required this.status,
    required this.type,
    this.data,
    this.errorMessage = "No Error",
    this.geoCode = AppConstants.DEFAULT_GEOCODE,
  });




  @override
  List<Object?> get props => [type, errorMessage, status, data, geoCode];

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherType? type,
    String? errorMessage,
    WeatherResponse? data,
    GeoCode? geoCode,
  }) {
    return WeatherState(
      status: status ?? this.status,
      type: type ?? this.type,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      geoCode: geoCode ?? this.geoCode,
    );
  }
}
