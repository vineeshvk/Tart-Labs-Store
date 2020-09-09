import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @JsonKey(name: 'token_type')
  String tokenType;
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'expires_in')
  int expiresIn;
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  TokenModel({
    this.tokenType,
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> map) => _$TokenModelFromJson(map);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}