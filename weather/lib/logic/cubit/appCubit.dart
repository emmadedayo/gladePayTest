import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/utilities/app_utility.dart';
import 'package:weather/logic/state/app_state.dart';

import '../../data/repository/weather_repository.dart';


class AppCubit extends Cubit<AppState> {

  WeatherRepository weatherRepository = WeatherRepository();
  AppCubit(AppState initialState) : super(initialState) {
    initState();
  }

  initState() async {
    state.isLoading = true;
    locationInit();
    initLastKnownLocation();
    emit(state.copy());
    if (await AppUtility.determinePosition()) {
      state.position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      if (kDebugMode) {
        print("object ${state.position}");
      }
      if (state.position != null) {
        state.todayForCast = [];
        state.futureForCast = [];
        state.currentLocation = await weatherRepository.getCurrentLocationWeather('${state.position?.latitude ?? 0.0},${state.position?.longitude ?? 0.0}');
        state.forCastResponseEntity = await weatherRepository.getForecastLocationWeather('${state.position?.latitude ?? 0.0},${state.position?.longitude ?? 0.0}');
        state.todayForCast?.addAll(state.forCastResponseEntity?.forecast.forecastday[0].hour ?? []);
        state.futureForCast?.addAll(state.forCastResponseEntity?.forecast.forecastday ?? []);

        print("localtime ${state.forCastResponseEntity?.location.localtime}");
      }
    } else {

    }
    state.isLoading = false;
    emit(state.copy());
  }

  Future<void> initLastKnownLocation() async {
    Position? position;
    try {
      position = (await Geolocator.getLastKnownPosition(forceAndroidLocationManager: false));
    } on PlatformException {
      position = null;
    }
    state.lastKnownPositions = position;
    emit(state.copy());
  }

  locationInit(){
    if (defaultTargetPlatform == TargetPlatform.android) {
      state.locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 1,
        forceLocationManager: false,
        intervalDuration: const Duration(seconds: 10),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
      state.locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 1,
        pauseLocationUpdatesAutomatically: false,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      state.locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 1,
      );
    }
    emit(state.copy());
  }
}