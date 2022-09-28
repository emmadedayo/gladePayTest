// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQuality _$AirQualityFromJson(Map<String, dynamic> json) => AirQuality(
      (json['co'] as num?)?.toDouble(),
      (json['no'] as num?)?.toDouble(),
      (json['o3'] as num?)?.toDouble(),
      (json['so2'] as num?)?.toDouble(),
      (json['pm2_5'] as num?)?.toDouble(),
      (json['pm10'] as num?)?.toDouble(),
      (json['us-epa-index'] as num?)?.toDouble(),
      (json['gb-defra-index'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AirQualityToJson(AirQuality instance) =>
    <String, dynamic>{
      'co': instance.co,
      'no': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm2_5': instance.pm25,
      'pm10': instance.pm10,
      'us-epa-index': instance.usEpaIndex,
      'gb-defra-index': instance.gbDefraIndex,
    };
