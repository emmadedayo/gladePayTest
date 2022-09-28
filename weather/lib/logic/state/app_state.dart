import 'package:geolocator/geolocator.dart';
import 'package:weather/data/entities/forcast_day_entity/forcast_day_entity.dart';
import 'package:weather/data/entities/hour_entity/hour_entity.dart';

import '../../data/entities/current_location/current_location.dart';
import '../../data/entities/forcast_response/forcast_response_entity.dart';


class AppState {

  Position? position, lastKnownPositions;
  String address = 'Enter Drop Off Location';
  String? tempOption;
  bool isLoading;
  LocationSettings locationSettings = const LocationSettings();
  CurrentLocation? currentLocation;
  ForCastResponseEntity? forCastResponseEntity;
  List<Hour>? todayForCast;
  List<ForeCastDay>? futureForCast;

  AppState({
    this.position,
    this.lastKnownPositions,
    this.isLoading: false,
    this.tempOption,
    this.currentLocation,
    this.forCastResponseEntity,
    this.todayForCast,
    this.futureForCast,
  });

  AppState copy() {
    AppState copy = AppState(position: position,
        lastKnownPositions: lastKnownPositions,
        isLoading: isLoading,
        currentLocation: currentLocation,
        todayForCast: todayForCast,
        futureForCast: futureForCast,
        forCastResponseEntity: forCastResponseEntity,
        tempOption: tempOption,
    );

    copy.locationSettings = locationSettings;
    copy.forCastResponseEntity = forCastResponseEntity;
    copy.address = address;
    return copy;
  }
}