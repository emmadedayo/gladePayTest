
import 'package:json_annotation/json_annotation.dart';

import '../astro_entity/astro_entity.dart';
import '../day_entity/day_entity.dart';
import '../hour_entity/hour_entity.dart';

part 'forcast_day_entity.g.dart';
@JsonSerializable()
class ForeCastDay {
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'date_epoch')
  int dateEpoch;
  @JsonKey(name: 'day')
  Day day;
  @JsonKey(name: 'astro')
  Astro astro;
  @JsonKey(name: 'hour')
  List<Hour> hour;

  ForeCastDay(this.date, this.dateEpoch, this.day, this.astro, this.hour);

  factory ForeCastDay.fromJson(Map<String, dynamic> srcJson) => _$ForeCastDayFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ForeCastDayToJson(this);

}