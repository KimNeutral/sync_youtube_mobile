import 'package:optional/optional.dart';

class BaseData {
  String message;
  List<Error> errors;
}

class SYError {
  String field;
  String message;

  SYError({
    this.field,this.message,
  });

  factory SYError.fromJson(Map<String,dynamic> json){
    return SYError(
      field: json['field'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() => {
    'field': field,
    'message': message,
  };

  @override
  String toString() {
    return 'SYError{field: $field, message: $message}';
  }


}

List<SYError> parseErrors(List errors) {
  if(errors == null) return List<SYError>();

  var errorsList = Optional.of(errors)
      .map((i) => i.map((item) => SYError.fromJson(item)).toList())
      .orElse(List<SYError>());

  return errorsList;
}