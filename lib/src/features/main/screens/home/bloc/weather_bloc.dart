import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:weather_app/src/common/constant/constants.dart';
import 'package:weather_app/src/features/main/screens/home/data/models/geocode.dart';
import 'package:weather_app/src/features/main/screens/home/data/models/weather_response.dart';

import '../domain/params/geocode_params.dart';
import '../domain/params/weather_params.dart';
import '../domain/usecases/get_geocode.dart';
import '../domain/usecases/get_weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;
  final GetGeoCode getGeoCode;

  WeatherBloc({
    required this.getWeather,
    required this.getGeoCode,
  }) : super(const WeatherState(
          type: WeatherType.daily,
          status: WeatherStatus.initial,
        )) {
    on<WeatherSetTypeEvent>(_setType);
    on<WeatherGetEvent>(_getWeather);
    on<WeatherSetCurrentLocationEvent>(_setCurrentLocation);
    on<WeatherGetCodeEvent>(_getGeoCode);
  }

  FutureOr<void> _setType(
    WeatherSetTypeEvent event,
    Emitter<WeatherState> emit,
  ) {
    emit(state.copyWith(type: event.type));
  }

  FutureOr<void> _getWeather(
    WeatherGetEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    final response = await getWeather.call(
      WeatherParams(
        lat: state.geoCode.lat,
        lon: state.geoCode.lon,
      ),
    );
    response.fold(
      (left) => emit(
        state.copyWith(
          status: WeatherStatus.error,
          errorMessage: left.message,
        ),
      ),
      (right) => emit(
        state.copyWith(
          data: right,
          status: WeatherStatus.success,
        ),
      ),
    );
  }

  FutureOr<void> _setCurrentLocation(
    WeatherSetCurrentLocationEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final location = await getMyLocation();
    if (location?.latitude == state.geoCode.lat &&
        location?.longitude == state.geoCode.lon) {
      return;
    }
    add(
      WeatherGetCodeEvent(
        latitude: location?.latitude ?? AppConstants.DEFAULT_LAT,
        longitude: location?.longitude ?? AppConstants.DEFAULT_LON,
      ),
    );
  }

  Future<LocationData?> getMyLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;
    final Location location = Location();
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    locationData = await location.getLocation();
    return locationData;
  }

  FutureOr<void> _getGeoCode(
    WeatherGetCodeEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(
      state.copyWith(
        status: WeatherStatus.loading,
      ),
    );
    final response = await getGeoCode.call(
      GeoCodeParams(
        lat: event.latitude,
        lon: event.longitude,
        appId: AppConstants.API_KEY,
      ),
    );
    response.fold(
      (left) => emit(
        state.copyWith(
          status: WeatherStatus.error,
          errorMessage: left.message,
        ),
      ),
      (right) {
        emit(
          state.copyWith(
            geoCode: right ?? AppConstants.DEFAULT_GEOCODE,
          ),
        );
        add(const WeatherGetEvent());
      },
    );
  }
}
