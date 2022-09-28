import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/data/entities/current_location/current_location.dart';
import 'package:weather/data/entities/history/history_entity.dart';
import 'package:weather/data/entities/location_search/location_search_entity.dart';

import '../entities/forcast_response/forcast_response_entity.dart';
import '../http/http_rest.dart';

class WeatherRepository{

  Dio dio = Dio();
  RestClient? apiClient;

  var apiKey = "b9eb4804274843c6b86145413222609";

  WeatherRepository(){
    dio = Dio();
    apiClient = RestClient(dio, baseUrl: 'https://api.weatherapi.com/v1');
  }

  Future<CurrentLocation?> getCurrentLocationWeather(String q) async{
    try{
      return await apiClient!.getCurrentLocationWeather(apiKey, q, "yes");
    }on DioError catch(e){
      if (kDebugMode) {
        print("objectobject ${e.requestOptions.uri}");
      }
    }
    return null;
  }

  Future<ForCastResponseEntity?> getForecastLocationWeather(String q) async{
    try{
      return await apiClient!.getForecastLocationWeather(apiKey, q, '10', 'yes', 'no');
    }on DioError catch(e){
      print("objectobject ${e.requestOptions.uri}");
    }
    return null;
  }

  Future<List<LocationSearch>?> getLocationSearchWeather(String q) async{
    try{
      return await apiClient!.getSearchLocationWeather(apiKey, q);
    }on DioError catch(e){
      print("objectobject ${e.requestOptions.uri}");
    }
    return null;
  }
}