import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    final cupertinoTabBar = CupertinoTabBar(
      backgroundColor: Colors.white,
      currentIndex: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon:Image.asset('assets/Home.png'),
            activeIcon:  Image.asset('assets/Home_active.png'),
            title: Text(
              "Now",
            )),
        BottomNavigationBarItem(
            icon:Image.asset('assets/panorama_fish_eye.png'),
            activeIcon:  Image.asset('assets/panorama_fish_eye_active.png'),
            title: Text(
              "Pause",
            )),
        BottomNavigationBarItem(
            icon:Image.asset('assets/luminous.png'),
            activeIcon:  Image.asset('assets/luminous_active.png'),
            title: Text(
              "Calm Down",
            )),
        BottomNavigationBarItem(
            icon:Image.asset('assets/nights_stay.png'),
            activeIcon:  Image.asset('assets/nights_stay_active.png'),
            title: Text(
              "Sleep",
            )),
        BottomNavigationBarItem(
            icon:Image.asset('assets/bubble_chart.png'),
            activeIcon:  Image.asset('assets/bubble_chart_active.png'),
            title: Text(
              "Energize",
            )),

      ],
      onTap: (int index) {
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Good Morning, John", style: TextStyle(color: Colors.black) , textAlign: TextAlign.center,),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Card(
              child: ListTile(title: Text('How are you feeling right now?'), subtitle: Text('Motivation')),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child:
            Text("Featured", style: TextStyle(color: Colors.black) , textAlign: TextAlign.left,),),

            SizedBox(
              height: 123.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => Center(child:  Image.asset('assets/motivation.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child:
              Text("Recent", style: TextStyle(color: Colors.black) , textAlign: TextAlign.left,),),

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
              child:
              Text("Start your day", style: TextStyle(color: Colors.black) , textAlign: TextAlign.left,),),

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
              child:
              Text("Start your day", style: TextStyle(color: Colors.black) , textAlign: TextAlign.left,),),

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
              child:
              Text("Start your day", style: TextStyle(color: Colors.black) , textAlign: TextAlign.left,),),

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
              child:
              Text("Start your day", style: TextStyle(color: Colors.black) , textAlign: TextAlign.left,),),

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
      ),
      bottomNavigationBar: cupertinoTabBar,

    );
  }
}
