import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppUtility{
  
  static const String apiKey = 'AIzaSyDsA3mNfc1hvz1ThjAj6z0qehiCpoQCQj4';
  
  static Future<bool> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    try {
      return true;
    } catch (e) {
      return false;
    }
  }

  static String parseTime(dateTime){
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String formatTime = DateFormat("hh:mm").format(parsedDateTime);
    return formatTime;
  }

  static String getMonthAndDay(dateTime){
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String formatTime = DateFormat("MMM,  dd").format(parsedDateTime);
    return formatTime;
  }
}