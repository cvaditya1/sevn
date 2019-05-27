import 'package:sevn/core/services/api.dart';
import 'package:sevn/locator.dart';
import 'package:sevn/core/models/video_item.dart';
import 'package:sevn/core/enums/view_state.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<VideoItem> videoItems;

  Future getVideoItems() async {
    setState(ViewState.BUSY);
    videoItems = await _api.getVideoItemList();
    setState(ViewState.IDLE);
  }

  Future getNextPage() async {
    setState(ViewState.BUSY);
    videoItems = await _api.getMoreVideoItems();
    setState(ViewState.IDLE);
  }
}
