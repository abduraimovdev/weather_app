import 'package:weather_app/src/common/service/api_service.dart';

import '../../../../../../common/constant/constants.dart';
import '../../../../../../common/util/failures.dart';
import '../models/weather_response.dart';
import '../../domain/params/geocode_params.dart';
import '../../domain/params/weather_params.dart';
import '../models/geocode.dart';


typedef dio = ApiService;

abstract class WeatherRemoteDataSource {
  Future<WeatherResponse?> getWeather(WeatherParams params);

  Future<GeoCode?> getGeoCode(GeoCodeParams params);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {

  WeatherRemoteDataSourceImpl();

  @override
  Future<WeatherResponse?> getWeather(WeatherParams params) async {
    try {
      final response = await dio.request(
        AppConstants.WEATHER,
        queryParams: params.toJson(),
      );

      if (response.statusCode == 200) {
        return WeatherResponse.fromJson(response.data);
      } else {
        throw ServerFailure(
          errorMessage: '${response.statusCode} ${response.statusMessage}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GeoCode?> getGeoCode(GeoCodeParams params) async {
    try {
      final response = await dio.request(
        AppConstants.GEOCODE,
        queryParams: params.toJson(),
      );

      if (response.statusCode == 200) {
        final i = response.data as Iterable;
        return List<GeoCode>.from(i.map((e) => GeoCode.fromJson(e))).first;
      } else {
        throw ServerFailure(
          errorMessage: '${response.statusCode} ${response.statusMessage}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
