import 'package:json_annotation/json_annotation.dart';
import 'package:tartlabsstore/src/models/token_model.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "token_type")
  String tokenType;
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @JsonKey(name: "expires_in")
  int expiresIn;

  AuthResponse({
    this.tokenType,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
  });

  TokenModel getToken() {
    return TokenModel(
        accessToken: this.accessToken,
        tokenType: this.tokenType,
        refreshToken: this.refreshToken,
        expiresIn: this.expiresIn);
  }

  factory AuthResponse.fromJson(Map<String, dynamic> map) =>
      _$AuthResponseFromJson(map);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
