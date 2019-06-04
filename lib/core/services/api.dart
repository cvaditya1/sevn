import 'package:youtube_api/youtube_api.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:sevn/core/models/video_item.dart';
import 'package:sevn/core/models/channel_item.dart';

class Api {
  String _apiKey = "";

  YoutubeAPI _youtubeAPI;
  String channelId = "UCmTqXrmTBfkRIbZiJ5xkhfg";
  List _ytAPIResult = [];
  List<VideoItem> _videoItems = [];
  ChannelItem _channelItem;

  Future<List<VideoItem>> getVideoItemList() async {
    var apiKey = _youtubeAPI?.key ?? "";
    if (apiKey.isEmpty) {
      Secret secret = await SecretLoader(secretPath: "assets/config.json").load();
      _apiKey = secret.apiKey;
      _youtubeAPI = new YoutubeAPI(_apiKey, type: "channel");

    }

    _ytAPIResult = await _youtubeAPI.channelDetail(channelId);
    for (YT_API result in _ytAPIResult) {
      _channelItem = _getChannelDetails(result);
    }

    _ytAPIResult = await _youtubeAPI.channel(channelId);
    for (YT_API result in _ytAPIResult) {
      VideoItem item = _getVideoItem(result) ?? null;
      if(item != null)_videoItems.add(item);
    }
    return _videoItems;
  }

  Future<List<VideoItem>> getMoreVideoItems() async {
    _ytAPIResult = await _youtubeAPI.nextPage();
    for (YT_API result in _ytAPIResult) {
      VideoItem item = _getVideoItem(result) ?? null;
      if(item != null)_videoItems.add(item);
    }
    return _videoItems;
  }

  VideoItem _getVideoItem(YT_API result){
    var kind = result?.kind ?? "";
    if(kind.isNotEmpty && kind == "video"){
      return VideoItem(result);
    }
    return null;
  }

  ChannelItem _getChannelDetails(YT_API result){
    var kind = result?.kind ?? "";
    if(kind.isNotEmpty && kind == "channel"){
      print("#### Channel KInd");
      print(kind);
      return ChannelItem(result);
    }
    return null;
  }

  ChannelItem getChannelItem(){
    return _channelItem;
  }
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
  Future<Secret> load() async {
    return rootBundle.loadStructuredData<Secret>(this.secretPath,
        (jsonStr) async {
      final secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}
