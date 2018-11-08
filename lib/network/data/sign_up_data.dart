import 'package:sync_youtube_mobile/model/user.dart';
import 'package:sync_youtube_mobile/network/data/base_data.dart';

class SignUpData {
  String message;
  User data;
  List<SYError> errors;

  SignUpData({this.message, this.errors, this.data});

  factory SignUpData.fromJson(Map<String, dynamic> json) {
    var signUpData = SignUpData(
        message: json['message'],
        errors: parseErrors(json['errors'] as List),
        data: User.fromJson(json['data'])
    );

    return signUpData;
  }

  @override
  String toString() {
    return 'SignUpData{message: $message, data: $data, errors: $errors}';
  }
}