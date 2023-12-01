import 'package:dartz/dartz.dart';
import '../../../../../../common/util/failures.dart';
import '../../../../../../common/util/usecase.dart';
import '../../data/models/weather_response.dart';
import '../params/weather_params.dart';
import '../repository/weather_repository.dart';


class GetWeather implements UseCase<WeatherResponse?, WeatherParams> {
  final WeatherRepository repository;

  GetWeather({required this.repository});

  @override
  Future<Either<Failure, WeatherResponse?>> call(WeatherParams params) async {
    return await repository.getWeather(params);
  }
}
