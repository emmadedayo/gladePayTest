// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      (json['maxtemp_c'] as num).toDouble(),
      (json['maxtemp_f'] as num).toDouble(),
      (json['mintemp_c'] as num).toDouble(),
      (json['mintemp_f'] as num).toDouble(),
      (json['avgtemp_c'] as num).toDouble(),
      (json['avgtemp_f'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'maxtemp_c': instance.maxtempC,
      'maxtemp_f': instance.maxtempF,
      'mintemp_c': instance.mdoubleempC,
      'mintemp_f': instance.mdoubleempF,
      'avgtemp_c': instance.avgtempC,
      'avgtemp_f': instance.avgtempF,
      'condition': instance.condition,
    };
