import 'package:json_annotation/json_annotation.dart';

part 'astro_entity.g.dart';
@JsonSerializable()
class Astro {

  @JsonKey(name: 'sunrise')
  String sunrise;
  @JsonKey(name: 'sunset')
  String sunset;
  @JsonKey(name: 'moonrise')
  String moonrise;
  @JsonKey(name: 'moonset')
  String moonset;
  @JsonKey(name: 'moon_phase')
  String moonPhase;
  @JsonKey(name: 'moon_illumination')
  String moonIllumination;

  Astro(this.sunrise, this.sunset, this.moonrise, this.moonset, this.moonPhase, this.moonIllumination);

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

  Map<String, dynamic> toJson() => _$AstroToJson(this);
}