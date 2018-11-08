class TokenInfo {
  static const PREFIX = "Bearer ";

  String token;
  String refreshToken;

  String getTokenWithPrefix() => PREFIX + token;
}