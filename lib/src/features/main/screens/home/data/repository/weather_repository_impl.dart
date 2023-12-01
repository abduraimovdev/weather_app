import 'package:dartz/dartz.dart';
import '../../../../../../common/util/failures.dart';
import '../../domain/params/geocode_params.dart';
import '../../domain/params/weather_params.dart';
import '../../domain/repository/weather_repository.dart';
import '../data_source/weather_remote_data_source.dart';
import '../models/geocode.dart';
import '../models/weather_response.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remoteSource;

  WeatherRepositoryImpl({
    required this.remoteSource,
  });

  @override
  Future<Either<Failure, WeatherResponse?>> getWeather(
      WeatherParams params) async {
    try {
      final data = await remoteSource.getWeather(params);
      return Right(data);
    } on ServerFailure catch (e) {
      print('server');
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, GeoCode?>> getGeoCode(GeoCodeParams params) async {
    try {
      final data = await remoteSource.getGeoCode(params);
      return Right(data);
    } on ServerFailure catch (e) {
      print('server');
      return Left(e);
    }
  }
}
