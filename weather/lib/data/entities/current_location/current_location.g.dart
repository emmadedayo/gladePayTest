// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentLocation _$CurrentLocationFromJson(Map<String, dynamic> json) =>
    CurrentLocation(
      Location.fromJson(json['location'] as Map<String, dynamic>),
      Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentLocationToJson(CurrentLocation instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };
