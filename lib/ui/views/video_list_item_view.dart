import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sevn/core/models/video_item.dart';

class VideoListItem extends StatelessWidget {
  final VideoItem videoItem;
  final Function onTap;

  const VideoListItem({this.videoItem, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Image.network(
                videoItem.ytAPIItem.thumbnail['high']['url'],
                fit: BoxFit.cover,
              ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Icon(
                    Icons.account_circle,
                    size: 40.0,
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          videoItem.ytAPIItem.title,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Text(
                        videoItem.ytAPIItem.channelTitle,
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  flex: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*
@override
Widget build(BuildContext context) {
  return Container(
      child: Card(
          child: ListTile(
            leading: Image.network(videoItem.ytAPIItem.thumbnail['high']['url']),
            title: Text(videoItem.ytAPIItem.title),
            onTap: onTap,
          )));
}*/
