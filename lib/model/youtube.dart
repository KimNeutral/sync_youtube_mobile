import 'package:sync_youtube_mobile/model/model.dart';
import 'package:sync_youtube_mobile/model/user.dart';

class Youtube extends Model{
  int id;
  User user;
  String title;
  String url;
  String thumbnail;
  int seconds;
  DateTime createdAt;
  DateTime updatedAt;

  Youtube({
    this.id,this.user,this.title,this.url,this.thumbnail,this.seconds,this.createdAt,this.updatedAt,
  });

  factory Youtube.fromJson(Map<String,dynamic> json){
    var item = Youtube(
      id: json['id'],
      user: User.fromJson(json['user']),
      title: json['title'],
      url: json['url'],
      thumbnail: json['thumbnail'],
      seconds: json['seconds'],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

    return item;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'title': title,
    'url': url,
    'thumbnail': thumbnail,
    'seconds': seconds,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };

  @override
  String toString() {
    return 'Youtube{id: $id, user: $user, title: $title, url: $url, thumbnail: $thumbnail, seconds: $seconds, createdAt: $createdAt, updatedAt: $updatedAt}';
  }


}