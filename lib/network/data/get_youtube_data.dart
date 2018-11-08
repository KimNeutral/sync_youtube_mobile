import 'package:sync_youtube_mobile/model/youtube.dart';
import 'package:sync_youtube_mobile/network/data/base_data.dart';
import 'package:optional/optional.dart';

class GetYoutubeData {
  String message;
  Youtube data;
  List<SYError> errors;

  GetYoutubeData({this.message, this.data, this.errors});

  factory GetYoutubeData.fromJson(Map<String, dynamic> json) {
    var errors = json['errors'] as List;
    var errorsList = parseErrors(errors);

    var obj = GetYoutubeData(
      message: json['message'],
      data: Youtube.fromJson(json['data']),
      errors: errorsList,
    );

    return obj;
  }

  @override
  String toString() {
    return 'GetYoutubeData{message: $message, data: $data, errors: $errors}';
  }


}