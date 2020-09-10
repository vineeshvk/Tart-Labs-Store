import 'package:json_annotation/json_annotation.dart';

part 'app_url_model.g.dart';

@JsonSerializable()
class AppUrlModel {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'app_name')
  final String appName;

  @JsonKey(name: 'app_logo')
  final String appLogo;

  @JsonKey(name: 'app_url')
  final String appUrl;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'app_version')
  final double appVersion;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  AppUrlModel({
    this.appUrl,
    this.appVersion,
    this.id,
    this.appLogo,
    this.description,
    this.updatedAt,
    this.appName,
    this.createdAt,
  });

  factory AppUrlModel.fromJson(Map<String, dynamic> map) =>
      _$AppUrlModelFromJson(map);
  Map<String, dynamic> toJson() => _$AppUrlModelToJson(this);
}
