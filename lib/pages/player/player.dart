import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inhale/components/app-tab-bar.dart';
import 'package:audioplayers/audioplayers.dart';

enum PlayerState { stopped, playing, paused }
enum PlayingRouteState { speakers, earpiece }

class PlayerPage extends StatefulWidget {
  PlayerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool playing = false;
  bool seekCompleted = true;

  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerSeekSubscription;
  PlayerState _playerState = PlayerState.stopped;
  PlayingRouteState _playingRouteState = PlayingRouteState.speakers;

  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);

    _durationSubscription = audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);

      // if (Theme.of(context).platform == TargetPlatform.iOS) {
      //   // (Optional) listen for notification updates in the background
      //   audioPlayer.startHeadlessService();

      //   // set at least title to see the notification bar on ios.
      //   audioPlayer.setNotification(
      //     title: 'Under the sea',
      //     artist: 'Inhale',
      //     albumTitle: 'Inhale',
      //     imageUrl: 'Inhale',
      //     duration: duration,
      //     elapsedTime: Duration(seconds: 0),
      //     hasNextTrack: false,
      //     hasPreviousTrack: false,
      //   );
      // }
    });

    _positionSubscription =
        audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
              _position = p;
            }));

    _playerErrorSubscription = audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });

    _playerSeekSubscription = audioPlayer.onSeekComplete.listen((event) {
      seekCompleted = true;
    });

    _playerCompleteSubscription =
        audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = null;
      });
    });
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerSeekSubscription?.cancel();
    audioPlayer.stop();
    audioPlayer.dispose();

    super.dispose();
  }

  Future<void> _play() async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;

    AudioPlayer player = await audioCache.play("under_the_sea.mp3");
    player.seek(playPosition ?? Duration(seconds: 0));

    setState(() => _playerState = PlayerState.playing);
  }

  Future<int> _pause() async {
    final result = await audioPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    return result;
  }

  Widget body() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 360,
          child: Container(
            child: Stack(children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/under_the_sea.png')),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60),
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
        SizedBox(
            height: 50,
            child: Container(
              padding: EdgeInsets.only(bottom: 0),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Slider(
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    onChanged: (v) {
                      // final position = v * _duration.inMilliseconds;
                      if (seekCompleted) {
                        seekCompleted = false;
                        audioPlayer.seek(Duration(seconds: v.toInt()));
                      }
                    },
                    value: (_position != null)
                        ? _position.inSeconds.toDouble()
                        : 0.0,
                  ),
                ),
              ),
            )),
        SizedBox(
            height: 100,
            child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: () => {(_isPlaying) ? _pause() : _play()},
                      child: (_isPlaying)
                          ? Image.asset(
                              'assets/pause.png',
                              width: 78,
                              height: 78,
                            )
                          : Image.asset(
                              'assets/play.png',
                              width: 78,
                              height: 78,
                            )),
                ))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: body(),
      bottomNavigationBar: AppTabBar(
        currentIndex: 0,
      ),
    );
  }
}
