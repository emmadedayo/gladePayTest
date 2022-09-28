import 'package:json_annotation/json_annotation.dart';

part 'location_search_entity.g.dart';

@JsonSerializable()
class LocationSearch {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'region')
  String? region;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'lat')
  double? lat;

  @JsonKey(name: 'lon')
  double? lon;

  @JsonKey(name: 'url')
  String? url;

  LocationSearch(this.id, this.name, this.region, this.country, this.lat, this.lon, this.url);

  factory LocationSearch.fromJson(Map<String, dynamic> json) => _$LocationSearchFromJson(json);

  Map<String, dynamic> toJson() => _$LocationSearchToJson(this);
}
