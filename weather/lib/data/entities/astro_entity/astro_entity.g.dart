// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Astro _$AstroFromJson(Map<String, dynamic> json) => Astro(
      json['sunrise'] as String,
      json['sunset'] as String,
      json['moonrise'] as String,
      json['moonset'] as String,
      json['moon_phase'] as String,
      json['moon_illumination'] as String,
    );

Map<String, dynamic> _$AstroToJson(Astro instance) => <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'moon_illumination': instance.moonIllumination,
    };
