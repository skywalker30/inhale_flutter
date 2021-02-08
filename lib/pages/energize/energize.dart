import 'package:flutter/material.dart';
import 'package:inhale/components/app-tab-bar.dart';

class EnergizePage extends StatefulWidget {
  EnergizePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EnergizePageState createState() => _EnergizePageState();
}

class _EnergizePageState extends State<EnergizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Energize",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: Text("Comming Soon"),
      bottomNavigationBar: AppTabBar(
        currentIndex: 4,
      ),
    );
  }
}
