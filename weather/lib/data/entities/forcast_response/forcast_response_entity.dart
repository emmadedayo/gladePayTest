import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/entities/current/current.dart';

import '../forcast_entity/forcast_entity.dart';
import '../location/location.dart';

part 'forcast_response_entity.g.dart';

@JsonSerializable()
class ForCastResponseEntity {

  @JsonKey(name: 'location')
  Location location;
  @JsonKey(name: 'current')
  Current current;
  @JsonKey(name: 'forecast')
  Forecast forecast;

  ForCastResponseEntity(this.location, this.current, this.forecast);

  factory ForCastResponseEntity.fromJson(Map<String, dynamic> srcJson) => _$ForCastResponseEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ForCastResponseEntityToJson(this);


}