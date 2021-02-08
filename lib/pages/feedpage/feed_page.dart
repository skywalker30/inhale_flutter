import 'package:flutter/material.dart';
import 'package:inhale/bloc/home_feed_bloc.dart';
import 'package:inhale/components/app-tab-bar.dart';
import 'package:inhale/model/home_feed.dart';
import 'package:inhale/networking/api_response.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Good Morning, John",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _bloc.getHomeFeed(),
        child: StreamBuilder<ApiResponse<HomeFeed>>(
          stream: _bloc.homeStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return FeedPageViewLoading();
                  break;
                case Status.COMPLETED:
                  return FeedPageView(
                    homeFeed: snapshot.data.data,
                  );
                  break;
                case Status.ERROR:
                  return FeedPageViewError(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.getHomeFeed(),
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
              Positioned(
                left: 30,
                top: 40,
                child: Text(
                  "How are you feeling right now?",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Featured",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          Stack(
            children: [
              Container(
                  height: 213,
                  width: double.infinity,
                  color: Colors.white,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/featured.png',
                        fit: BoxFit.fill,
                      ))),
              Positioned(
                left: 30,
                top: 40,
                child: Text(
                  "Under the sea",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Recent",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 123.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Center(child: Image.asset('assets/calming_sounds.png')),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Start your day",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 123.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Center(child: Image.asset('assets/calming_sounds.png')),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Start your day",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 123.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Center(child: Image.asset('assets/calming_sounds.png')),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Start your day",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 123.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Center(child: Image.asset('assets/calming_sounds.png')),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Start your day",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 123.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Center(child: Image.asset('assets/calming_sounds.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedPageViewLoading extends StatelessWidget {
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
              Positioned(
                left: 30,
                top: 40,
                child: Text(
                  "How are you feeling right now?",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Center(
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
