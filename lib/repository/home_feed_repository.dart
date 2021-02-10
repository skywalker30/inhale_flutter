import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:inhale/model/home_feed.dart';

class HomeFeedRepository {
  Future<HomeFeed> getHomeFeed() async {
    await new Future.delayed(const Duration(milliseconds: 500));
    String jsonString = await rootBundle.loadString("assets/home_feed.json");
    final jsonResponse = jsonDecode(jsonString);
    return HomeFeed.fromJson(jsonResponse);
  }
}
