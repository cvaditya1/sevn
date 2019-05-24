import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sevn/core/models/video_item.dart';

class VideoListItem extends StatelessWidget {
  final VideoItem videoItem;
  final Function(VideoItem) onTap;

  VideoListItem({this.videoItem, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: ListTile(
      leading: Image.network(videoItem.ytAPIItem.thumbnail['high']['url']),
      title: Text(videoItem.ytAPIItem.title),
      onTap: onTap(videoItem),
    )));
  }
}
