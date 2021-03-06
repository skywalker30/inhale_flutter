import 'package:flutter/material.dart';
import 'package:inhale/components/app-tab-bar.dart';

class PausePage extends StatefulWidget {
  PausePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PausePageState createState() => _PausePageState();
}

class _PausePageState extends State<PausePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          "Pause",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: Text(""),
      bottomNavigationBar: AppTabBar(
        currentIndex: 1,
      ),
    );
  }
}
