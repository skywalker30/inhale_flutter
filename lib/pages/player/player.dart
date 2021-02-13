import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inhale/components/app-tab-bar.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool playing = false;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer audioPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    audioPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });

    audioPlayer.completionHandler = () => setState(() {
          playing = false;
          _position = Duration(seconds: 0);
        });
  }

  @override
  void dispose() {
    print("dispose");
    audioPlayer.stop();
    audioPlayer.dispose();

    super.dispose();
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
                    value: _position.inSeconds.toDouble(),
                    onChanged: (value) => {
                      if (playing)
                        {
                          setState(() {
                            Duration newDuration =
                                Duration(seconds: value.toInt());
                            audioPlayer.seek(newDuration);
                            value = value;
                          })
                        }
                    },
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
                      onTap: () => {
                            setState(() {
                              (playing)
                                  ? audioPlayer.pause()
                                  : audioCache.play("under_the_sea.mp3");
                              playing = !playing;
                            }),
                          },
                      child: (playing)
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
