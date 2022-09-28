import 'package:json_annotation/json_annotation.dart';

import '../condition/condition.dart';

part 'hour_entity.g.dart';
@JsonSerializable()
class Hour {
  @JsonKey(name: 'time_epoch')
  double timeEpoch;
  @JsonKey(name: 'time')
  String time;
  @JsonKey(name: 'temp_c')
  double tempC;
  @JsonKey(name: 'temp_f')
  double tempF;
  @JsonKey(name: 'is_day')
  double isDay;
  @JsonKey(name: 'condition')
  Condition condition;
  @JsonKey(name: 'humidity')
  double humidity;

  Hour(
      this.timeEpoch,
      this.time,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.humidity,
);

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}