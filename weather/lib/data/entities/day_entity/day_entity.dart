import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/entities/condition/condition.dart';

part 'day_entity.g.dart';
@JsonSerializable()
class Day {

  @JsonKey(name: 'maxtemp_c')
  double maxtempC;
  @JsonKey(name: 'maxtemp_f')
  double maxtempF;
  @JsonKey(name: 'mintemp_c')
  double mdoubleempC;
  @JsonKey(name: 'mintemp_f')
  double mdoubleempF;
  @JsonKey(name: 'avgtemp_c')
  double avgtempC;
  @JsonKey(name: 'avgtemp_f')
  double avgtempF;
  @JsonKey(name: 'maxwind_mph')
  double maxwindMph;
  @JsonKey(name: 'maxwind_kph')
  double maxwindKph;
  @JsonKey(name: 'totalprecip_mm')
  double totalprecipMm;
  @JsonKey(name: 'totalprecip_in')
  double totalprecipIn;
  @JsonKey(name: 'avgvis_km')
  double avgvisKm;
  @JsonKey(name: 'avgvis_miles')
  double avgvisMiles;
  @JsonKey(name: 'avghumidity')
  double avghumidity;
  @JsonKey(name: 'daily_will_it_rain')
  double dailyWillItRain;
  @JsonKey(name: 'daily_chance_of_rain')
  double dailyChanceOfRain;
  @JsonKey(name: 'daily_will_it_snow')
  double dailyWillItSnow;
  @JsonKey(name: 'daily_chance_of_snow')
  double dailyChanceOfSnow;
  @JsonKey(name: 'condition')
  Condition condition;
  @JsonKey(name: 'uv')
  double uv;

  Day(
      this.maxtempC,
      this.maxtempF,
      this.mdoubleempC,
      this.mdoubleempF,
      this.avgtempC,
      this.avgtempF,
      this.maxwindMph,
      this.maxwindKph,
      this.totalprecipMm,
      this.totalprecipIn,
      this.avgvisKm,
      this.avgvisMiles,
      this.avghumidity,
      this.dailyWillItRain,
      this.dailyChanceOfRain,
      this.dailyWillItSnow,
      this.dailyChanceOfSnow,
      this.condition,
      this.uv);

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}