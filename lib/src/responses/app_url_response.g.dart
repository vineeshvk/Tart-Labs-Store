// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUrlResponse _$AppUrlResponseFromJson(Map<String, dynamic> json) {
  return AppUrlResponse(
    appUrls: (json['appUrls'] as List)
        ?.map((e) =>
            e == null ? null : AppUrlModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppUrlResponseToJson(AppUrlResponse instance) =>
    <String, dynamic>{
      'appUrls': instance.appUrls,
    };
