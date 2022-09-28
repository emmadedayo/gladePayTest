import 'package:json_annotation/json_annotation.dart';
import '../condition/condition.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  @JsonKey(name: 'last_updated_epoch')
  double lastUpdatedEpoch;
  @JsonKey(name: 'last_updated')
  String lastUpdated;
  @JsonKey(name: 'temp_c')
  double tempC;
  @JsonKey(name: 'temp_f')
  double tempF;
  @JsonKey(name: 'is_day')
  double isDay;
  @JsonKey(name: 'condition')
  Condition condition;
  @JsonKey(name: 'wind_mph')
  double windMph;
  @JsonKey(name: 'wind_kph')
  double windKph;
  @JsonKey(name: 'wind_degree')
  double windDegree;
  @JsonKey(name: 'wind_dir')
  String windDir;
  @JsonKey(name: 'humidity')
  double humidity;
  @JsonKey(name: 'cloud')
  double cloud;


  Current(this.lastUpdatedEpoch, this.lastUpdated, this.tempC, this.tempF, this.isDay, this.condition, this.windMph, this.windKph, this.windDegree, this.windDir, this.humidity, this.cloud);

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);



}