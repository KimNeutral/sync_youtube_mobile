import 'package:sync_youtube_mobile/model/youtube.dart';
import 'package:sync_youtube_mobile/network/data/base_data.dart';
import 'package:optional/optional.dart';

class GetAllYoutubeData {
  String message;
  List<Youtube> data;
  List<SYError> errors;

  GetAllYoutubeData({this.message, this.data, this.errors});

  factory GetAllYoutubeData.fromJson(Map<String, dynamic> json) {
    var data = json['data'] == null ? [] : json['data'] as List;
    var youtubeList = data.map((item) => Youtube.fromJson(item)).toList();

    var errors = json['errors'] as List;
    var errorsList = parseErrors(errors);

    var obj = GetAllYoutubeData(
      message: json['message'],
      data: youtubeList,
      errors: errorsList,
    );

    print(obj);

    return obj;
  }

  @override
  String toString() {
    return 'GetAllYoutubeData{message: $message, data: $data, errors: $errors}';
  }


}