import 'package:sync_youtube_mobile/model/model.dart';

class User extends Model {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String email;
  String name;

  User({
    this.id,this.email,this.name,this.createdAt,this.updatedAt,
  });

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}