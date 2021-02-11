import 'dart:async';

import 'package:inhale/model/home_feed.dart';
import 'package:inhale/networking/api_response.dart';
import 'package:inhale/repository/home_feed_repository.dart';

class HomeFeedBloc {
  HomeFeedRepository _homeFeedRepository;

  StreamController _homeFeedController;

  StreamSink<ApiResponse<HomeFeed>> get homeSink => _homeFeedController.sink;

  Stream<ApiResponse<HomeFeed>> get homeStream => _homeFeedController.stream;

  HomeFeedBloc() {
    _homeFeedController = StreamController<ApiResponse<HomeFeed>>();
    _homeFeedRepository = HomeFeedRepository();
    getHomeFeed(false);
  }

  getHomeFeed(bool withRefresh) async {
    withRefresh
        ? homeSink.add(ApiResponse.loadingrefresh('Loading'))
        : homeSink.add(ApiResponse.loading('Loading'));
    try {
      HomeFeed homeFeed = await _homeFeedRepository.getHomeFeed();
      homeSink.add(ApiResponse.completed(homeFeed));
    } catch (e) {
      homeSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _homeFeedController?.close();
  }
}
