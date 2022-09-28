// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hour _$HourFromJson(Map<String, dynamic> json) => Hour(
      (json['time_epoch'] as num).toDouble(),
      json['time'] as String,
      (json['temp_c'] as num).toDouble(),
      (json['temp_f'] as num).toDouble(),
      (json['is_day'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
      (json['humidity'] as num).toDouble(),
    );

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
      'time_epoch': instance.timeEpoch,
      'time': instance.time,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'humidity': instance.humidity,
    };
