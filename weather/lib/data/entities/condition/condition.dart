
import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';
@JsonSerializable()
class Condition {

  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'icon')
  String icon;
  @JsonKey(name: 'code')
  int code;

  Condition(this.text, this.icon, this.code);

  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

}