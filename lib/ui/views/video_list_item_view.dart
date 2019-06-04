import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sevn/core/models/video_item.dart';
import 'package:sevn/core/models/channel_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

class VideoListItem extends StatelessWidget {
  final ChannelItem channelItem;
  final VideoItem videoItem;
  final Function onTap;

  const VideoListItem({this.channelItem, this.videoItem, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: CachedNetworkImage(
                imageUrl: videoItem.ytAPIItem.thumbnail['high']['url'],
                placeholder: (context, url) => Image.memory(kTransparentImage),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fit: BoxFit.cover,
              )
                  /* Image.network(
                videoItem.ytAPIItem.thumbnail['high']['url'],
                fit: BoxFit.cover,)*/
                  )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: getChannelIcon(channelItem),
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

  Widget getChannelIcon(ChannelItem channelItem) {
    return (channelItem == null)
        ? Icon(
            Icons.account_circle,
            size: 40.0,
          )
        : Container(
      padding: EdgeInsets.all(8.0),
      child: ClipOval(
      child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: channelItem.ytAPIItem.thumbnail['default']['url']),
    ),);
    /*CachedNetworkImage(
            imageUrl: channelItem.ytAPIItem.thumbnail['high']['url'],
            fit: BoxFit.cover,
            placeholder: (context, url) => Image.memory(kTransparentImage),
          );*/
    FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: channelItem.ytAPIItem.thumbnail['high']['url'],
      height: 40.0,
      width: 40.0,
    );
    //CachedNetworkImage(imageUrl: channelItem.ytAPIItem.thumbnail['high']['url'], fit: BoxFit.cover,);
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
