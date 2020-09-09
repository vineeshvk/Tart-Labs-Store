// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResponse _$AppResponseFromJson(Map<String, dynamic> json) {
  return AppResponse(
    apps: (json['apps'] as List)
        ?.map((e) =>
            e == null ? null : AppModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppResponseToJson(AppResponse instance) =>
    <String, dynamic>{
      'apps': instance.apps,
    };
