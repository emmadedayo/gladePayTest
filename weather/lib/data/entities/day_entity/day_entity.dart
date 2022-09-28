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
  @JsonKey(name: 'condition')
  Condition condition;

  Day(
      this.maxtempC,
      this.maxtempF,
      this.mdoubleempC,
      this.mdoubleempF,
      this.avgtempC,
      this.avgtempF,
      this.condition,);

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}