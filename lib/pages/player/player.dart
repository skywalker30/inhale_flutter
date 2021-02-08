import 'package:flutter/material.dart';
import 'package:inhale/bloc/home_feed_bloc.dart';
import 'package:inhale/components/app-tab-bar.dart';
import 'package:inhale/model/home_feed.dart';
import 'package:inhale/networking/api_response.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
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
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Under the sea",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: StreamBuilder<ApiResponse<HomeFeed>>(
        stream: _bloc.homeStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data.status) {
              case Status.LOADING:
                return PlayerPageViewLoading();
                break;
              case Status.COMPLETED:
                return PlayerPageView(
                  homeFeed: snapshot.data.data,
                );
                break;
              case Status.ERROR:
                return PlayerPageViewError(
                  errorMessage: snapshot.data.message,
                  onRetryPressed: () => _bloc.getHomeFeed(),
                );
                break;
            }
          }
          return Container();
        },
      ),
      bottomNavigationBar: AppTabBar(
        currentIndex: 0,
      ),
    );
  }
}

class PlayerPageView extends StatelessWidget {
  final HomeFeed homeFeed;
  const PlayerPageView({this.homeFeed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 4,
          child: SizedBox.expand(
            child: Container(
              child: Stack(children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/under_the_sea.png')),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Text(
                        "Under the sea",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )),
              ]),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: SizedBox.expand(
            child: Container(
              color: Colors.amber,
              child: Text("player control"),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: SizedBox.expand(
            child:
                Container(child: Align(child: Image.asset('assets/pause.png'))),
          ),
        ),
      ],
    );
  }
}

class PlayerPageViewLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[Text("data")],
      ),
    );
  }
}

class PlayerPageViewError extends StatelessWidget {
  final String errorMessage;
  final Function onRetryPressed;

  const PlayerPageViewError({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("error");
  }
}
