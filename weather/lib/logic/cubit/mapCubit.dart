import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/core/utilities/app_utility.dart';
import 'package:weather/data/repository/weather_repository.dart';
import 'package:weather/logic/state/mapState.dart';

import '../../data/entities/location_search/location_search_entity.dart';


class MapCubit extends Cubit<MapState> {

  MapCubit(MapState initialState) : super(initialState) {
    initState();
  }

  WeatherRepository weatherRepository = WeatherRepository();

  initState() async {
    state.isLoading = true;
    state.markers.clear();
    locationInit();
    initLastKnownLocation();
    emit(state.copy());

    if (await AppUtility.determinePosition()) {
      state.position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (kDebugMode) {
        print("object ${state.position}");
      }
      if (state.position != null) {
        state.mapController?.animateCamera(
          CameraUpdate?.newCameraPosition(
            CameraPosition(
              target: LatLng(state.position?.latitude ?? 0.0,
                  state.position?.longitude ?? 0.0),
              zoom: 17.0,
            ),
          ),
        );
        state.currentLocation = await weatherRepository.getCurrentLocationWeather('${state.position?.latitude},${state.position?.longitude}');
      }
    } else {

    }
    state.isLoading = true;
    emit(state.copy());
  }

  onCameraMove(CameraPosition position) {
    state.cameraPosition = position;
    emit(state.copy());
  }

  // getPositionName(lat,lng) async {
  //   if (lat != null && lng != null) {
  //     var result = await Geolocator.
  //     state.currentAddress = result?.results![0].formattedAddress ?? 'Current Location';
  //     emit(state);
  //   }
  // }

  Future<void> initLastKnownLocation() async {
    Position? position;
    try {
      position = (await Geolocator.getLastKnownPosition(
          forceAndroidLocationManager: false));
    } on PlatformException {
      position = null;
    }
    state.lastKnownPositions = position;
    emit(state.copy());
  }

  locationInit() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      state.locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 1,
        forceLocationManager: false,
        intervalDuration: const Duration(seconds: 10),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
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

  void onMapCreated(GoogleMapController mapController) {
    state.mapController = mapController;
    emit(state.copy());
  }

  searchLocation(String eventChange) {
    state.searchLocation = eventChange;
    emit(state.copy());
    loadLocation();
  }

  loadLocation() async {
    state.locationSearch = [];
    if (state.searchLocation.length > 2) {
      state.searchLoading = true;
      state.locationSearch = await weatherRepository.getLocationSearchWeather(state.searchLocation);
      if (state.locationSearch != null) {
        state.searchLoading = false;
      }
    }
    emit(state.copy());
  }

  addMarker(LocationSearch locationSearch) async {
    state.selectedLocation = locationSearch;
    emit(state.copy());
    await getLocationDetails();
    displayMarker();
  }

  displayMarker(){
    state.markers.clear();
    state.searchController = TextEditingController(text: state.selectedLocation?.name ?? '');
    state.pickupMarker = Marker(
      markerId: MarkerId('drop_off_destination${UniqueKey()}'),
      position: LatLng(state.selectedLocation?.lat ?? 0.0, state.selectedLocation?.lon ?? 0.0),
      icon: BitmapDescriptor.defaultMarker,
    );
    state.mapController?.animateCamera(
      CameraUpdate?.newCameraPosition(
        CameraPosition(
          target: LatLng(state.selectedLocation?.lat ?? 0.0, state.selectedLocation?.lon ?? 0.0),
          zoom: 13.0,
        ),
      ),
    );
    state.markers.add(state.pickupMarker!);
    print("searchController ${state.selectedLocation?.name}");
    state.locationSearch?.clear();
    emit(state.copy());
   // await getLocationDetails(state.selectedLocation?.lat, state.selectedLocation?.lon);
  }

  getLocationDetails() async {
    state.currentLocation = await weatherRepository.getCurrentLocationWeather('${state.selectedLocation?.lat},${state.selectedLocation?.lon}');
    emit(state.copy());
  }
}