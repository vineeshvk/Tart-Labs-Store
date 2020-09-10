// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUrlModel _$AppUrlModelFromJson(Map<String, dynamic> json) {
  return AppUrlModel(
    appUrl: json['app_url'] as String,
    appVersion: (json['app_version'] as num)?.toDouble(),
    id: json['id'] as int,
    appLogo: json['app_logo'] as String,
    description: json['description'] as String,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    appName: json['app_name'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );
}

Map<String, dynamic> _$AppUrlModelToJson(AppUrlModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'app_name': instance.appName,
      'app_logo': instance.appLogo,
      'app_url': instance.appUrl,
      'created_at': instance.createdAt?.toIso8601String(),
      'description': instance.description,
      'app_version': instance.appVersion,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
