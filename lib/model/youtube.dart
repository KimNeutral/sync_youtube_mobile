import 'package:sync_youtube_mobile/model/model.dart';

class Youtube extends Model{
  String id;
  String user;
  String title;
  String url;
  String thumbnail;
  String seconds;
  DateTime createdAt;
  DateTime updatedAt;

  Youtube({
    this.id,this.user,this.title,this.url,this.thumbnail,this.seconds,this.createdAt,this.updatedAt,
  });

  factory Youtube.fromJson(Map<String,dynamic> json){
    return Youtube(
      id: json['id'],
      user: json['user'],
      title: json['title'],
      url: json['url'],
      thumbnail: json['thumbnail'],
      seconds: json['seconds'],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
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
}