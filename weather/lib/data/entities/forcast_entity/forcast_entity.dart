import 'package:json_annotation/json_annotation.dart';

import '../forcast_day_entity/forcast_day_entity.dart';

part 'forcast_entity.g.dart';
@JsonSerializable()
class Forecast {
  @JsonKey(name: 'forecastday')
  List<ForeCastDay> forecastday;

  Forecast(this.forecastday);

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}