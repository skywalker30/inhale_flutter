import 'package:flutter/material.dart';
import 'package:inhale/components/app-tab-bar.dart';

class CalmDownPage extends StatefulWidget {
  CalmDownPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalmDownPageState createState() => _CalmDownPageState();
}

class _CalmDownPageState extends State<CalmDownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Calm down",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: Text("Comming Soon"),
      bottomNavigationBar: AppTabBar(
        currentIndex: 2,
      ),
    );
  }
}
