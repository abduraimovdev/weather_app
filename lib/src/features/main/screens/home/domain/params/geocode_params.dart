import 'package:weather_app/src/common/constant/constants.dart';

class GeoCodeParams {
  final double lat;
  final double lon;
  final String appId;
  final int limit;

  const GeoCodeParams({
    this.lat = AppConstants.DEFAULT_LAT,
    this.lon = AppConstants.DEFAULT_LON,
    this.appId = AppConstants.API_KEY,
    this.limit = 1,
  });

  Map<String, Object?> toJson() {
    return {
      'lat': lat,
      'lon': lon,
      'appid': appId,
      'limit': limit,
    };
  }

  factory GeoCodeParams.fromJson(Map<String, Object?> json) {
    return GeoCodeParams(
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      appId: json['appid'] as String,
      limit: json['limit'] as int,
    );
  }
}
