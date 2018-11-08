import 'package:sync_youtube_mobile/common/exception/field_validation_exception.dart';

class SignUpDTO {
  String email;
  String name;
  String password;

  static _Builder builder() {
    return _Builder();
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': name,
    'password': password
  };
}

class _Builder {
  String _email;
  String _name;
  String _password;

  bool _isEmail(String email) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  _Builder email(String email) {
    _email = email;

    return this;
  }

  _Builder name(String name) {
    _name = name;

    return this;
  }

  _Builder password(String password) {
    _password = password;

    return this;
  }

  SignUpDTO build() {
    if (!_isEmail(_email)) {
      throw new FieldValidationException("Wrong email foramt.");
    }

    var dto = SignUpDTO();

    dto.name = _name;
    dto.email = _email;
    dto.password = _password;

    return dto;
  }
}