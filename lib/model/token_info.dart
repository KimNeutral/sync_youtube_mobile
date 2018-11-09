class TokenInfo {
  static const PREFIX = "Bearer ";

  String token;
  String refreshToken;

  String getTokenWithPrefix() => PREFIX + token;


  TokenInfo({this.token, this.refreshToken});

  factory TokenInfo.fromJson(Map<String, dynamic> json) {
    return TokenInfo(
      token: json['token'],
        refreshToken: json['refreshToken']
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'refreshToken': refreshToken
  };

  @override
  String toString() {
    return 'TokenInfo{token: $token, refreshToken: $refreshToken}';
  }
}