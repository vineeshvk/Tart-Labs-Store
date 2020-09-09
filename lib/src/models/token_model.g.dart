// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) {
  return TokenModel(
    tokenType: json['token_type'] as String,
    accessToken: json['access_token'] as String,
    expiresIn: json['expires_in'] as int,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'token_type': instance.tokenType,
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'refresh_token': instance.refreshToken,
    };
