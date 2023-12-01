import '../../../../../../common/constant/constants.dart';

class WeatherParams {
  final double? lat;
  final double? lon;
  final String? appId;
  final String? units;

  const WeatherParams({
    this.lat = AppConstants.DEFAULT_LAT,
    this.lon = AppConstants.DEFAULT_LON,
    this.appId = AppConstants.API_KEY,
    this.units = AppConstants.UNITS,
  });

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
      'appId': appId,
      'units': units,
    };
  }

  factory WeatherParams.fromJson(Map<String, Object?> map) {
    return WeatherParams(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      appId: map['appid'] as String,
      units: map['units'] as String,
    );
  }
}
