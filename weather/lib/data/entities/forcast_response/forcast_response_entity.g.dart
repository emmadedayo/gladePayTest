// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forcast_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForCastResponseEntity _$ForCastResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ForCastResponseEntity(
      Location.fromJson(json['location'] as Map<String, dynamic>),
      Current.fromJson(json['current'] as Map<String, dynamic>),
      Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForCastResponseEntityToJson(
        ForCastResponseEntity instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
