import 'package:json_annotation/json_annotation.dart';

import '../forcast_entity/forcast_entity.dart';
import '../location/location.dart';

part 'history_entity.g.dart';

@JsonSerializable()
class HistoryEntity {

  @JsonKey(name: 'location')
  Location location;
  @JsonKey(name: 'forecast')
  Forecast forecast;

  HistoryEntity(this.location, this.forecast);

  factory HistoryEntity.fromJson(Map<String, dynamic> srcJson) => _$HistoryEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HistoryEntityToJson(this);
}