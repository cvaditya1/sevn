import 'package:flutter/material.dart';
/*import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_api/youtube_api.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;*/

import 'package:sevn/locator.dart';
import 'package:sevn/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

const String title = "Sevn";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Router.generateRoute,
      //home: MyHomePage(title: title),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ListItemGestures{
  String _api_Key = "";

  YoutubeAPI _youtubeAPI;
  String channelId = "UCmTqXrmTBfkRIbZiJ5xkhfg";
  List<YT_API> _ytAPIResult = [];
  List<VideoItem> _videoItems = [];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: new Column(
              children: <Widget>[
                new Flexible(
                    child: new ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        itemCount: _videoItems.length,
                        itemBuilder: (_, int index) => _videoItems[index])),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: BoxConstraints.expand(height: 200.0),
              child: Stack(
                children: <Widget>[
                  YoutubePlayer(
                    context: context,
                    videoId: "9vzd289Eedk",
                    autoPlay: false,
                  ),
                  new Container(
                    alignment: Alignment.topRight,
                    child: IconButton(icon: Icon(Icons.close), onPressed: null),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initYTAPI();
  }

  initYTAPI() {
    var apiKey = _youtubeAPI?.key ?? "";
    if(apiKey.isEmpty){
      Future<Secret> secret = SecretLoader(secretPath: "assets/config.json").load();
      secret.then((secret) {
        print("API " + secret.apiKey);
        _api_Key = secret.apiKey;
        _youtubeAPI = new YoutubeAPI(_api_Key);
        callYTAPI();
      });
    }
  }

  callYTAPI() async {
    _youtubeAPI.key = "channel";
    _ytAPIResult = await _youtubeAPI.channel(channelId);
    setState(() {
      for (YT_API result in _ytAPIResult) {
        VideoItem item = new VideoItem(
          ytAPIItem: result,
          listItemGestures: this,
        );
        _videoItems.add(item);
      }
    });
  }

  @override
  void onTap(YT_API ytAPIItem) {
    setState(() {
      print("Tap" + ytAPIItem.url);
    });
  }
}*/

/*class VideoItem extends StatelessWidget {
  final YT_API ytAPIItem;
  final ListItemGestures listItemGestures;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          child: ListTile(
            leading: Image.network(ytAPIItem.thumbnail['high']['url']),
            title: Text(ytAPIItem.title),
            onTap: () => listItemGestures.onTap(ytAPIItem),
          )
    ));
  }

  VideoItem({this.ytAPIItem, this.listItemGestures});
}*/

/*void _onVideoItemTapped(YT_API ytAPIItem){
  print("Tap" + ytAPIItem.url);
}*/

/*mixin ListItemGestures on State<MyHomePage>{
  void onTap(YT_API ytAPIItem);
}

class Secret {
  final String apiKey;
  Secret({this.apiKey = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(apiKey: jsonMap["api_key"]);
  }
}

class SecretLoader {
  final String secretPath;

  SecretLoader({this.secretPath});
  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(this.secretPath,
            (jsonStr) async {
          final secret = Secret.fromJson(json.decode(jsonStr));
          return secret;
        });
  }
}*/
