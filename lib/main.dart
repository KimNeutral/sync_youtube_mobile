import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sync_youtube_mobile/model/token_info.dart';
import 'package:sync_youtube_mobile/model/youtube.dart';
import 'package:sync_youtube_mobile/network/network_manager.dart';
import 'dart:async';

import 'package:stack_trace/stack_trace.dart';
import 'package:cached_network_image/cached_network_image.dart';

Type typeOf<T>() => T;

TokenInfo tokenInfo;

const String CHANNEL = "com.kimneutral.io/intent";

void main() async {
  Type type = typeOf<List<Youtube>>();
  var manager = NetworkManager();
  print(type);
  var resp = await manager.login("01rlaeodyd@naver.com", "1234");
  if(resp.data != null) {
    tokenInfo = resp.data;
  }

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(title: 'Sync Youtube'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const platform = const MethodChannel(CHANNEL);

  Future<List<Youtube>> youtube;

  Future<List<Youtube>> loadAllYoutube() async {
    var resp = await NetworkManager().getAllYoutube(tokenInfo);
    return resp.data;
  }

  @override
  void initState() {
    super.initState();
    youtube = loadAllYoutube();
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
      future: youtube,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getMainWidget(context, snapshot);
        } else if (snapshot.hasError) {
          return Center(child: Text("Error occured!"));
        }
        return CircularProgressIndicator();
      });

    return new Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(widget.title, style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 2.0,
        ),
        preferredSize: Size.fromHeight(50.0),
      ),
      body: Center(
        child: futureBuilder
      ),
    );
  }

  Widget getMainWidget(BuildContext context, AsyncSnapshot snapshot) {
    if(snapshot.data.length == 0) {
      return Text("No youtube data!");
    } else {
      return getListView(context, snapshot);
    }
  }

  ListView getListView(BuildContext context, AsyncSnapshot snapshot) {
    var list = snapshot.data as List<Youtube>;

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var item = list[index];
        print(item);
        return embedDivider(
          InkWell(
            child: Container(
              height: 85.0,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Row(
                children: <Widget>[
                  getThumbnail(item.thumbnail),
                  Padding(padding: EdgeInsets.only(right: 20.0)),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      item.title,
                      overflow: TextOverflow.fade,
                    )
                  ),
                ],
              )
            ),
            onTap: () {
              platform.invokeMethod("launchYoutube", <String,dynamic> {
                "url": item.url
              });
            },
          )
        );
      }
    );
  }

  Widget embedDivider(Widget child) {
    var children = <Widget>[
      child,
      Divider(height: 1.0, color: Colors.black38,),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  Widget getThumbnail(url) {
    return new CachedNetworkImage(
      imageUrl: url,
      placeholder: new CircularProgressIndicator(),
      errorWidget: new Icon(Icons.error),
      width: 100.0,
    );
  }
}
