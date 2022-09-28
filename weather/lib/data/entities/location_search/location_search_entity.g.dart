// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_search_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationSearch _$LocationSearchFromJson(Map<String, dynamic> json) =>
    LocationSearch(
      json['id'] as int?,
      json['name'] as String?,
      json['region'] as String?,
      json['country'] as String?,
      (json['lat'] as num?)?.toDouble(),
      (json['lon'] as num?)?.toDouble(),
      json['url'] as String?,
    );

Map<String, dynamic> _$LocationSearchToJson(LocationSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'url': instance.url,
    };
