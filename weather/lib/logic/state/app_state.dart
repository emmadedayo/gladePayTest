import 'package:geolocator/geolocator.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:weather/data/entities/forcast_day_entity/forcast_day_entity.dart';
import 'package:weather/data/entities/hour_entity/hour_entity.dart';

import '../../data/entities/current_location/current_location.dart';
import '../../data/entities/forcast_response/forcast_response_entity.dart';


class AppState {

  Position? position, lastKnownPositions;
  String address = 'Enter Drop Off Location';
  String? message = '';
  bool isLoading;
  LocationSettings locationSettings = const LocationSettings();
  CurrentLocation? currentLocation;
  ForCastResponseEntity? forCastResponseEntity;
  List<Hour>? todayForCast;
  List<ForeCastDay>? futureForCast;

  ItemScrollController? itemScrollController = ItemScrollController();
  ItemPositionsListener? itemPositionsListener = ItemPositionsListener.create();

  AppState({
    this.position,
    this.lastKnownPositions,
    this.isLoading: false,
    this.message,
    this.currentLocation,
    this.forCastResponseEntity,
    this.todayForCast,
    this.futureForCast,
    this.itemPositionsListener,
    this.itemScrollController,
  });

  AppState copy() {
    AppState copy = AppState(position: position,
        lastKnownPositions: lastKnownPositions,
        isLoading: isLoading,
        currentLocation: currentLocation,
        todayForCast: todayForCast,
        futureForCast: futureForCast,
        forCastResponseEntity: forCastResponseEntity,
        itemPositionsListener: itemPositionsListener,
    );

    copy.message = message;
    copy.locationSettings = locationSettings;
    copy.forCastResponseEntity = forCastResponseEntity;
    copy.address = address;
    return copy;
  }
}