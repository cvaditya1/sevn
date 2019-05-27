import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'base_view.dart';

import 'package:sevn/core/viewmodels/home_model.dart';
import 'package:sevn/core/models/video_item.dart';
import 'package:sevn/core/enums/view_state.dart';

import 'video_list_item_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _title = "Sevn";

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) => model.getVideoItems(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text(_title),
              ),
              body: model.state == ViewState.BUSY
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: <Widget>[
                        Container(
                          child: new Column(
                            children: <Widget>[
                              new Flexible(
                                  child: getVideoList(model.videoItems)),
                            ],
                          ),
                        ),
                        Container(
                          child: ((_videoIdSelected?.isNotEmpty ?? false)
                              ? getYoutubePlayer()
                              : null),
                        ),
                      ],
                    ),
            ));
  }

  String _videoIdSelected;

  Widget getVideoList(List<VideoItem> items) => ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: items.length,
        itemBuilder: (context, index) => VideoListItem(
              videoItem: items[index],
              onTap: () {
                setState(() {
                  print("Tapped");
                  _videoIdSelected = items[index].ytAPIItem.id;
                });
              },
            ),
      );

  var currentAlignment = Alignment.bottomCenter;
  var currentVideoHeight = 200.0;

  Widget getYoutubePlayer() => Align(
        alignment: currentAlignment,
        child: Container(
          constraints: BoxConstraints.expand(height: currentVideoHeight),
          child: Stack(
            children: <Widget>[
              YoutubePlayer(
                context: context,
                videoId: _videoIdSelected,
                autoPlay: false,
              ),
              new Container(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _videoIdSelected = "";
                      });
                    }),
              ),
            ],
          ),
        ),
      );
}
