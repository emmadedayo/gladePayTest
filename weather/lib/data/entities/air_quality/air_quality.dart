import 'package:json_annotation/json_annotation.dart';

part 'air_quality.g.dart';
@JsonSerializable()
class AirQuality {

  @JsonKey(name: 'co')
  double? co;
  @JsonKey(name: 'no')
  double? no2;
  @JsonKey(name: 'o3')
  double? o3;
  @JsonKey(name: 'so2')
  double? so2;
  @JsonKey(name: 'pm2_5')
  double? pm25;
  @JsonKey(name: 'pm10')
  double? pm10;
  @JsonKey(name: 'us-epa-index')
  double? usEpaIndex;
  @JsonKey(name: 'gb-defra-index')
  double? gbDefraIndex;

  AirQuality(this.co, this.no2, this.o3, this.so2, this.pm25, this.pm10, this.usEpaIndex, this.gbDefraIndex);

  factory AirQuality.fromJson(Map<String, dynamic> json) => _$AirQualityFromJson(json);

  Map<String, dynamic> toJson() => _$AirQualityToJson(this);
}