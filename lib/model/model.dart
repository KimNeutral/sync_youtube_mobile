
import 'package:sync_youtube_mobile/model/user.dart';
import 'package:sync_youtube_mobile/model/youtube.dart';

Type typeOf<T>() => T;

class Model {

}

class ModelFactory {
  static Model fromJson<T extends Model>(Map<String, dynamic> json) {
    Type type = typeOf<T>();
    String className = type.toString();

    switch(className) {
      case "User":
        return User.fromJson(json);
        break;
      case "Youtube":
        return Youtube.fromJson(json);
        break;
      default:
        throw new NoSuchModelException(cause: className + "is not a class that driven by Model class");
    }
  }
}

class NoSuchModelException implements Exception {
  String cause;
  NoSuchModelException({this.cause});
}