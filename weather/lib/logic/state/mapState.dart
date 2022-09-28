import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/data/entities/location_search/location_search_entity.dart';

import '../../data/entities/current_location/current_location.dart';

class MapState {

  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  Position? position, lastKnownPositions;
  Marker? pickupMarker;
  Set<Marker> markers = HashSet();
  LatLng? currentLatLng;
  String? message = '';
  LocationSettings locationSettings = const LocationSettings();
  bool isLoading,searchLoading;
  TextEditingController? searchController = TextEditingController();
  late List<LocationSearch>? locationSearch;
  LocationSearch? selectedLocation;
  CurrentLocation? currentLocation;
  String searchLocation;


  MapState({
    this.mapController, this.cameraPosition, this.position, this.lastKnownPositions,
    this.locationSettings: const LocationSettings(), this.currentLatLng,
    this.message,this.isLoading: false,this.searchLoading: false,
    this.locationSearch = const [],
    this.selectedLocation,
    this.currentLocation,
    this.searchLocation: '',
  });

  MapState copy() {
    MapState copy = MapState(searchLocation:searchLocation,mapController: mapController, cameraPosition: cameraPosition, position: position, lastKnownPositions: lastKnownPositions, currentLatLng: currentLatLng,
        locationSettings: locationSettings, message: message,isLoading: isLoading,searchLoading: searchLoading,currentLocation: currentLocation);

    copy.pickupMarker = pickupMarker;
    copy.locationSearch = locationSearch;
    copy.searchController=searchController;
    copy.markers = markers;
    copy.selectedLocation = selectedLocation;
    copy.locationSettings = locationSettings;
    return copy;
  }
}