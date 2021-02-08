import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppTabBar extends StatefulWidget {
  AppTabBar({Key key, this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  _AppTabBarState createState() =>
      _AppTabBarState(this.currentIndex);
}

class _AppTabBarState extends State<AppTabBar> {
  int _currentIndex = 0;
  int cIndex = 0;

  _AppTabBarState(int currentIndex) {
    this.cIndex = currentIndex;
  }

  @override
  void initState() {
    setState(() {
      this._currentIndex = cIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      backgroundColor: Colors.white,
      currentIndex: this._currentIndex,
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
  }
}
