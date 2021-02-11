import 'package:flutter/material.dart';
import 'package:inhale/components/app-tab-bar.dart';

class SleepPage extends StatefulWidget {
  SleepPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          "Sleep",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: Text(""),
      bottomNavigationBar: AppTabBar(
        currentIndex: 3,
      ),
    );
  }
}
