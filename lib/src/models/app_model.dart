import 'package:json_annotation/json_annotation.dart';
part 'app_model.g.dart';

@JsonSerializable()
class AppModel {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'app_name')
  final String appName;

  @JsonKey(name: 'app_logo')
  final String appLogo;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'app_description')
  final String appDescription;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  AppModel({
    this.id,
    this.appLogo,
    this.appDescription,
    this.updatedAt,
    this.appName,
    this.createdAt,
  });

  factory AppModel.fromJson(Map<String, dynamic> map) =>
      _$AppModelFromJson(map);
  Map<String, dynamic> toJson() => _$AppModelToJson(this);
}
