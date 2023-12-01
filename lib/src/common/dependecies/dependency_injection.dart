import 'package:get_it/get_it.dart';
import 'package:weather_app/src/features/main/screens/add_card/bloc/add_card_bloc.dart';
import 'package:weather_app/src/features/main/screens/add_card/data/repository/card_repository_impl.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/repository/card_repository.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/usecase/add_card.dart';
import 'package:weather_app/src/features/main/screens/card/domain/usecase/get_cards.dart';
import 'package:weather_app/src/features/main/screens/home/data/repository/weather_repository_impl.dart';
import 'package:weather_app/src/features/main/screens/home/domain/repository/weather_repository.dart';
import 'package:weather_app/src/features/main/screens/home/domain/usecases/get_geocode.dart';
import 'package:weather_app/src/features/main/screens/home/domain/usecases/get_weather.dart';

import '../../features/main/bloc/main_bloc.dart';
import '../../features/main/screens/card/bloc/card_bloc.dart';
import '../../features/main/screens/home/bloc/weather_bloc.dart';
import '../../features/main/screens/home/data/data_source/weather_remote_data_source.dart';

final $sl = GetIt.instance;

void injection() {
  // Card
  $sl.registerSingleton<CardRepository>(CardRepositoryImpl());

  // UseCase
  $sl.registerSingleton<GetCards>(GetCards(repository: $sl()));
  $sl.registerSingleton<AddCard>(AddCard(repository: $sl()));

  // Bloc
  $sl.registerFactory<WeatherBloc>(
      () => WeatherBloc(getWeather: $sl(), getGeoCode: $sl()));
  $sl.registerFactory<MainBloc>(() => MainBloc());
  $sl.registerFactory<AddCardBloc>(() => AddCardBloc(addCard: $sl()));
  $sl.registerFactory<CardBloc>(() => CardBloc(getCards: $sl()));

  // Weather
  $sl.registerSingleton<WeatherRemoteDataSource>(WeatherRemoteDataSourceImpl());
  $sl.registerSingleton<WeatherRepository>(
      WeatherRepositoryImpl(remoteSource: $sl()));
  $sl.registerSingleton<GetWeather>(GetWeather(repository: $sl()));
  $sl.registerSingleton<GetGeoCode>(GetGeoCode(repository: $sl()));
}
