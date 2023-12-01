import 'package:dartz/dartz.dart';
import '../../../../../../common/util/failures.dart';
import '../../data/models/geocode.dart';
import '../../data/models/weather_response.dart';
import '../params/geocode_params.dart';
import '../params/weather_params.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponse?>> getWeather(WeatherParams params);

  Future<Either<Failure, GeoCode?>> getGeoCode(GeoCodeParams params);
}
