import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/data/entities/current_location/current_location.dart';
import 'package:weather/data/entities/location_search/location_search_entity.dart';
import '../entities/forcast_response/forcast_response_entity.dart';
import '../http/http_rest.dart';

class WeatherRepository{

  Dio dio = Dio();
  RestClient? apiClient;
  late SharedPreferences prefs;
  var apiKey = "621a2abbea1f41398c8214802221110";

  WeatherRepository(){
    dio = Dio();
    apiClient = RestClient(dio, baseUrl: 'https://api.weatherapi.com/v1');
  }

  Future<CurrentLocation?> getCurrentLocationWeather(String q) async{
    try{
      return await apiClient!.getCurrentLocationWeather(apiKey, q, "yes");
    }on DioError catch(e){
      if (kDebugMode) {
        debugPrint("objectobject ${e.requestOptions.uri}");
      }
    }
    return null;
  }

  Future<ForCastResponseEntity?> getForecastLocationWeather(String q) async{
    try{
      return await apiClient!.getForecastLocationWeather(apiKey, q, '10', 'yes', 'no');
    }on DioError catch(e){
      debugPrint("objectobject ${e.requestOptions.uri}");
    }
    return null;
  }

  Future<List<LocationSearch>?> getLocationSearchWeather(String q) async{
    try{
      return await apiClient!.getSearchLocationWeather(apiKey, q);
    }on DioError catch(e){
      debugPrint("objectobject ${e.requestOptions.uri}");
    }
    return null;
  }

  Future<String?> getTempOption() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('temperatureOption') ?? 'C';
  }

  Future<bool> saveOption(String tempDisplay) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save the language
    return await prefs.setString('temperatureOption', tempDisplay);
  }

}