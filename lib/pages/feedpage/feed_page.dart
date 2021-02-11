import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inhale/bloc/home_feed_bloc.dart';
import 'package:inhale/components/app-tab-bar.dart';
import 'package:inhale/model/home_feed.dart';
import 'package:inhale/networking/api_response.dart';
import 'package:inhale/pages/player/player.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  HomeFeedBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = HomeFeedBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          title: StreamBuilder(
              stream: Stream.periodic(
                  Duration(seconds: 5), (data) => DateTime.now()),
              builder: (context, snapshot) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    (DateTime.now().hour >= 5 && DateTime.now().hour < 12)
                        ? "Good Morning, John"
                        : (DateTime.now().hour >= 12 &&
                                DateTime.now().hour < 17)
                            ? "Good Afternoon, John"
                            : (DateTime.now().hour >= 17 &&
                                    DateTime.now().hour < 21)
                                ? "Good Evening, John"
                                : (DateTime.now().hour >= 21 ||
                                        DateTime.now().hour < 5)
                                    ? "Good Night, John"
                                    : "Good Morning, John",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                );
              })),
      body: RefreshIndicator(
        onRefresh: () => _bloc.getHomeFeed(true),
        child: StreamBuilder<ApiResponse<HomeFeed>>(
          stream: _bloc.homeStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return FeedPageViewLoading(
                    refresh: false,
                  );
                  break;
                case Status.LOADINGREFRESH:
                  return FeedPageViewLoading(
                    refresh: true,
                  );
                  break;
                case Status.COMPLETED:
                  return FeedPageView(
                    homeFeed: snapshot.data.data,
                  );
                  break;
                case Status.ERROR:
                  return FeedPageViewError(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.getHomeFeed(false),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: AppTabBar(
        currentIndex: 0,
      ),
    );
  }
}

class FeedPageView extends StatelessWidget {
  final HomeFeed homeFeed;
  const FeedPageView({this.homeFeed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.white,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/motivation.png',
                        fit: BoxFit.fill,
                      ))),
              Container(
                height: 100,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "How are you feeling right now?",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                "Featured",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Stack(
            children: [
              GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => PlayerPage()))
                },
                child: Container(
                    height: 213,
                    width: double.infinity,
                    color: Colors.white,
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/featured.png',
                          fit: BoxFit.fill,
                        ))),
              ),
              Container(
                height: 213,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      "Under the sea",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                "Recent",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: 123.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: homeFeed.recent.session.length,
                itemBuilder: (BuildContext context, int index) => Container(
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        Image.asset(
                            'assets/' + homeFeed.recent.session[index].photo),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              homeFeed.recent.session[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/' +
                                homeFeed.recent.session[index].icon),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          StreamBuilder(
            stream:
                Stream.periodic(Duration(seconds: 5), (data) => DateTime.now()),
            builder: (context, snapshot) {
              return Wrap(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      (DateTime.now().hour >= 5 && DateTime.now().hour < 12)
                          ? homeFeed.now.morning.title
                          : (DateTime.now().hour >= 12 &&
                                  DateTime.now().hour < 17)
                              ? homeFeed.now.afternoon.title
                              : (DateTime.now().hour >= 17 &&
                                      DateTime.now().hour < 21)
                                  ? homeFeed.now.evening.title
                                  : (DateTime.now().hour >= 21 ||
                                          DateTime.now().hour < 5)
                                      ? homeFeed.now.night.title
                                      : homeFeed.now.morning.title,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(
                  height: 123.0,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: homeFeed.now.morning.session.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                              padding: EdgeInsets.all(5),
                              child: Stack(
                                children: [
                                  (DateTime.now().hour >= 5 &&
                                          DateTime.now().hour < 12)
                                      ? Image.asset('assets/' +
                                          homeFeed
                                              .now.morning.session[index].photo)
                                      : (DateTime.now().hour >= 12 &&
                                              DateTime.now().hour < 17)
                                          ? Image.asset('assets/' +
                                              homeFeed.now.afternoon
                                                  .session[index].photo)
                                          : (DateTime.now().hour >= 17 &&
                                                  DateTime.now().hour < 21)
                                              ? Image.asset('assets/' +
                                                  homeFeed.now.evening
                                                      .session[index].photo)
                                              : (DateTime.now().hour >= 21 ||
                                                      DateTime.now().hour < 5)
                                                  ? Image.asset('assets/' +
                                                      homeFeed.now.night
                                                          .session[index].photo)
                                                  : Image.asset('assets/' +
                                                      homeFeed
                                                          .now
                                                          .morning
                                                          .session[index]
                                                          .photo),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        (DateTime.now().hour >= 5 &&
                                                DateTime.now().hour < 12)
                                            ? homeFeed
                                                .now.morning.session[index].name
                                            : (DateTime.now().hour >= 12 &&
                                                    DateTime.now().hour < 17)
                                                ? homeFeed.now.afternoon
                                                    .session[index].name
                                                : (DateTime.now().hour >= 17 &&
                                                        DateTime.now().hour <
                                                            21)
                                                    ? homeFeed.now.evening
                                                        .session[index].name
                                                    : (DateTime.now().hour >=
                                                                21 ||
                                                            DateTime.now()
                                                                    .hour <
                                                                5)
                                                        ? homeFeed.now.night
                                                            .session[index].name
                                                        : homeFeed
                                                            .now
                                                            .morning
                                                            .session[index]
                                                            .name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: (DateTime.now().hour >= 5 &&
                                              DateTime.now().hour < 12)
                                          ? Image.asset('assets/' +
                                              homeFeed.now.morning
                                                  .session[index].icon)
                                          : (DateTime.now().hour >= 12 &&
                                                  DateTime.now().hour < 17)
                                              ? Image.asset('assets/' +
                                                  homeFeed.now.afternoon
                                                      .session[index].icon)
                                              : (DateTime.now().hour >= 17 ||
                                                      DateTime.now().hour < 21)
                                                  ? Image.asset('assets/' +
                                                      homeFeed.now.evening
                                                          .session[index].icon)
                                                  : (DateTime.now().hour >=
                                                              21 ||
                                                          DateTime.now().hour <
                                                              5)
                                                      ? Image.asset('assets/' +
                                                          homeFeed
                                                              .now
                                                              .night
                                                              .session[index]
                                                              .icon)
                                                      : Image.asset('assets/' +
                                                          homeFeed
                                                              .now
                                                              .morning
                                                              .session[index]
                                                              .icon),
                                    ),
                                  ),
                                ],
                              ))),
                ),
              ]);
            },
          )
        ],
      ),
    );
  }
}

class FeedPageViewLoading extends StatelessWidget {
  final bool refresh;
  FeedPageViewLoading({this.refresh});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            children: [
              Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.white,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/motivation.png',
                        fit: BoxFit.fill,
                      ))),
              Container(
                height: 100,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "How are you feeling right now?",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: !this.refresh,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 24),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedPageViewError extends StatelessWidget {
  final String errorMessage;
  final Function onRetryPressed;

  const FeedPageViewError({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("error");
  }
}
