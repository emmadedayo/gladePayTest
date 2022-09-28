import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather/data/entities/forcast_response/forcast_response_entity.dart';
import 'package:weather/data/entities/location_search/location_search_entity.dart';
import '../entities/current_location/current_location.dart';

part 'http_rest.g.dart';

@RestApi(baseUrl: "https://api.weatherapi.com/v1")

abstract class RestClient {

  factory RestClient(Dio dio, {required String baseUrl}){

    dio.options = BaseOptions(
        receiveTimeout: 30000,
        connectTimeout: 30000,
        contentType: 'application/json',
        /* If needed headers */
        headers: {
          'Content-Type': 'application/json'
        }
    );
    return _RestClient(dio,baseUrl:baseUrl);
  }


  //https://api.weatherapi.com/v1/current.json?key=b9eb4804274843c6b86145413222609&q=7.3567565,3.7976516&aqi=yes
  @GET("/current.json?key={key}&q={q}&aqi={aqi}")

  Future<CurrentLocation> getCurrentLocationWeather(
      @Path("key") String apiKey,
      @Path("q") String q,
      @Path("aqi") String aqi);

  //https://api.weatherapi.com/v1/forecast.json?key=b9eb4804274843c6b86145413222609&q=7.3567565,3.7976516&days=10&aqi=no&alerts=no
  @GET("/forecast.json?key={key}&q={q}&days={days}&aqi={aqi}&alerts={alerts}")
  Future<ForCastResponseEntity> getForecastLocationWeather(
      @Path("key") String key,
      @Path("q") String q,
      @Path("days") String days,
      @Path("aqi") String aqi,
      @Path("alerts") String alerts
      );

  //https://api.weatherapi.com/v1/search.json?key=b9eb4804274843c6b86145413222609&q=lagos
  @GET("/search.json?key={key}&q={q}")
  Future<List<LocationSearch>> getSearchLocationWeather(
      @Path("key") String key,
      @Path("q") String q
      );
}
