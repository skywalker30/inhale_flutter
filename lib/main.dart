import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inhale/components/app-tab-bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inhale',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Inhale'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: SingleChildScrollView(
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
                  child:
                      Center(child: Image.asset('assets/calming_sounds.png')),
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
                  child:
                      Center(child: Image.asset('assets/calming_sounds.png')),
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
                  child:
                      Center(child: Image.asset('assets/calming_sounds.png')),
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
                  child:
                      Center(child: Image.asset('assets/calming_sounds.png')),
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
                  child:
                      Center(child: Image.asset('assets/calming_sounds.png')),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppTabBar(
        currentIndex: 0,
      ),
    );
  }
}
