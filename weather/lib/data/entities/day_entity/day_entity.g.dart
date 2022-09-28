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
      (json['maxwind_mph'] as num).toDouble(),
      (json['maxwind_kph'] as num).toDouble(),
      (json['totalprecip_mm'] as num).toDouble(),
      (json['totalprecip_in'] as num).toDouble(),
      (json['avgvis_km'] as num).toDouble(),
      (json['avgvis_miles'] as num).toDouble(),
      (json['avghumidity'] as num).toDouble(),
      (json['daily_will_it_rain'] as num).toDouble(),
      (json['daily_chance_of_rain'] as num).toDouble(),
      (json['daily_will_it_snow'] as num).toDouble(),
      (json['daily_chance_of_snow'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
      (json['uv'] as num).toDouble(),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'maxtemp_c': instance.maxtempC,
      'maxtemp_f': instance.maxtempF,
      'mintemp_c': instance.mdoubleempC,
      'mintemp_f': instance.mdoubleempF,
      'avgtemp_c': instance.avgtempC,
      'avgtemp_f': instance.avgtempF,
      'maxwind_mph': instance.maxwindMph,
      'maxwind_kph': instance.maxwindKph,
      'totalprecip_mm': instance.totalprecipMm,
      'totalprecip_in': instance.totalprecipIn,
      'avgvis_km': instance.avgvisKm,
      'avgvis_miles': instance.avgvisMiles,
      'avghumidity': instance.avghumidity,
      'daily_will_it_rain': instance.dailyWillItRain,
      'daily_chance_of_rain': instance.dailyChanceOfRain,
      'daily_will_it_snow': instance.dailyWillItSnow,
      'daily_chance_of_snow': instance.dailyChanceOfSnow,
      'condition': instance.condition,
      'uv': instance.uv,
    };
