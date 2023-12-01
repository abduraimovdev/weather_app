import 'package:dartz/dartz.dart';
import '../../../../../../common/util/failures.dart';
import '../../../../../../common/util/usecase.dart';
import '../../data/models/geocode.dart';
import '../params/geocode_params.dart';
import '../repository/weather_repository.dart';




class GetGeoCode implements UseCase<GeoCode?, GeoCodeParams> {
  final WeatherRepository repository;

  GetGeoCode({required this.repository});

  @override
  Future<Either<Failure, GeoCode?>> call(GeoCodeParams params) async {
    return await repository.getGeoCode(params);
  }
}

