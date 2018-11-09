import 'package:sync_youtube_mobile/model/token_info.dart';
import 'package:sync_youtube_mobile/network/data/base_data.dart';

class LoginData {
  String message;
  List<SYError> errors;
  TokenInfo data;

  LoginData({this.message, this.errors, this.data});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    var loginData = LoginData(
      message: json['message'],
      errors: parseErrors(json['errors'] as List),
      data: TokenInfo.fromJson(json['data'])
    );
    return loginData;
  }

  @override
  String toString() {
    return 'LoginData{message: $message, errors: $errors, data: $data}';
  }
}