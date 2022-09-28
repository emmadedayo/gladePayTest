// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forcast_day_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForeCastDay _$ForeCastDayFromJson(Map<String, dynamic> json) => ForeCastDay(
      json['date'] as String,
      json['date_epoch'] as int,
      Day.fromJson(json['day'] as Map<String, dynamic>),
      (json['hour'] as List<dynamic>)
          .map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForeCastDayToJson(ForeCastDay instance) =>
    <String, dynamic>{
      'date': instance.date,
      'date_epoch': instance.dateEpoch,
      'day': instance.day,
      'hour': instance.hour,
    };
