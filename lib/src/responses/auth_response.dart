class AuthResponse {
  final String tokenType;
  final int expiresIn;
  final String accessToken;

  AuthResponse({this.tokenType, this.expiresIn, this.accessToken});

  factory AuthResponse.fromJson(Map json) {
    if (json != null)
      return AuthResponse(
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
      );
    return AuthResponse();
  }
}
