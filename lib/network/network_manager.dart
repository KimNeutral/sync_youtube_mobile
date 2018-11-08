import 'package:dio/dio.dart';
import 'package:sync_youtube_mobile/model/dto/signup_dto.dart';
import 'package:sync_youtube_mobile/model/token_info.dart';
import 'package:sync_youtube_mobile/network/data/datas.dart';
import 'dart:convert';
import 'dart:async';

class NetworkManager {
  static const String SERVER_URL = "https://kimneutral.tech/";
  static const String USER_URL = "api/users";
  static const String YOUTUBE_URL = "api/youtube";

  static const String AUTH_URL = "api/auth";
  static const String LOGIN_URL = "api/auth/login";
  static const String SIGNUP_URL = "api/auth/signup";

  Dio _getClient() {
    return Dio();
  }

  Future<LoginData> login(String email, String password) async {
    var requestData = {
      'email': email,
      'password': password
    };

    var response = await _request(_createURL(LOGIN_URL), Method.POST, data: json.encode(requestData));
    var responseData = LoginData.fromJson(response.data);

    return responseData;
  }

  Future<SignUpData> signUp(SignUpDTO dto) async {
    var response = await _request(_createURL(SIGNUP_URL), Method.POST, data: json.encode(dto.toJson()));
    var responseData = SignUpData.fromJson(response.data);

    return responseData;
  }

  Future<GetAllYoutubeData> getAllYoutube(TokenInfo tokenInfo) async {
    var response = await _request(_createURL(YOUTUBE_URL), Method.GET, tokenInfo: tokenInfo);
    var responseData = GetAllYoutubeData.fromJson(response.data);
    return responseData;
  }

  Future<GetYoutubeData> getYoutube(int id, TokenInfo tokenInfo) async {
    var response = await _request(_createURL(YOUTUBE_URL + "/$id"), Method.GET, tokenInfo: tokenInfo);
    var responseData = GetYoutubeData.fromJson(response.data);
    return responseData;
  }

  Future<Response> _request(String path, String method, {data, TokenInfo tokenInfo, Map<String, dynamic> headers = const {}}) async {
    if(headers == null) headers = {};
    if(tokenInfo != null) headers["Authorization"] = tokenInfo.token;
    
    var opt = Options(
      method: method,
      headers: headers,
    );
    try {
      var response = await _getClient().request(path, data: data, options: opt);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  String _createURL(String target) {
    return SERVER_URL + target;
  }
}

class Method {
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";
}