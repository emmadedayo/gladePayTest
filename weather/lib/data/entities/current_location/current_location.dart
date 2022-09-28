import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/entities/location/location.dart';

import '../current/current.dart';

part 'current_location.g.dart';
@JsonSerializable()
class CurrentLocation {
  @JsonKey(name: 'location')
  Location location;
  @JsonKey(name: 'current')
  Current current;

  CurrentLocation(this.location, this.current);

  factory CurrentLocation.fromJson(Map<String, dynamic> json) => _$CurrentLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentLocationToJson(this);

}