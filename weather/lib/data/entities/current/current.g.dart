// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      (json['last_updated_epoch'] as num).toDouble(),
      json['last_updated'] as String,
      (json['temp_c'] as num).toDouble(),
      (json['temp_f'] as num).toDouble(),
      (json['is_day'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
      (json['wind_mph'] as num).toDouble(),
      (json['wind_kph'] as num).toDouble(),
      (json['wind_degree'] as num).toDouble(),
      json['wind_dir'] as String,
      (json['humidity'] as num).toDouble(),
      (json['cloud'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
    };
