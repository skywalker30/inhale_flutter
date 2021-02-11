import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inhale/components/inhale-page-route.dart';
import 'package:inhale/pages/calmdown/calm_down.dart';
import 'package:inhale/pages/energize/energize.dart';
import 'package:inhale/pages/feedpage/feed_page.dart';
import 'package:inhale/pages/pause/pause.dart';
import 'package:inhale/pages/sleep/sleep.dart';

class AppTabBar extends StatefulWidget {
  AppTabBar({Key key, this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  _AppTabBarState createState() => _AppTabBarState(this.currentIndex);
}

class _AppTabBarState extends State<AppTabBar> {
  int _currentIndex = 0;
  int cIndex = 0;

  PageController _pageController;

  _AppTabBarState(int currentIndex) {
    this.cIndex = currentIndex;
  }

  @override
  void initState() {
    _pageController = PageController();
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
      border: Border(
        top: BorderSide(
          color: Colors.white,
          width: 0.0, // One physical pixel.
          style: BorderStyle.solid,
        ),
      ),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Image.asset('assets/Home.png'),
            activeIcon: Image.asset('assets/Home_active.png'),
            title: Text(
              "Now",
            )),
        BottomNavigationBarItem(
            icon: Image.asset('assets/panorama_fish_eye.png'),
            activeIcon: Image.asset('assets/panorama_fish_eye_active.png'),
            title: Text(
              "Pause",
            )),
        BottomNavigationBarItem(
            icon: Image.asset('assets/luminous.png'),
            activeIcon: Image.asset('assets/luminous_active.png'),
            title: Text(
              "Calm Down",
            )),
        BottomNavigationBarItem(
            icon: Image.asset('assets/nights_stay.png'),
            activeIcon: Image.asset('assets/nights_stay_active.png'),
            title: Text(
              "Sleep",
            )),
        BottomNavigationBarItem(
            icon: Image.asset('assets/bubble_chart.png'),
            activeIcon: Image.asset('assets/bubble_chart_active.png'),
            title: Text(
              "Energize",
            )),
      ],
      onTap: (int ind) {
        if (ind == 0) {
          Navigator.of(context).pushAndRemoveUntil(
              InhalePageRoute(FeedPage()), (route) => false);
        } else if (ind == 1) {
          Navigator.of(context).pushAndRemoveUntil(
              InhalePageRoute(PausePage()), (route) => false);
        } else if (ind == 2) {
          Navigator.of(context).pushAndRemoveUntil(
              InhalePageRoute(CalmDownPage()), (route) => false);
        } else if (ind == 3) {
          Navigator.of(context).pushAndRemoveUntil(
              InhalePageRoute(SleepPage()), (route) => false);
        } else if (ind == 4) {
          Navigator.of(context).pushAndRemoveUntil(
              InhalePageRoute(EnergizePage()), (route) => false);
        }
      },
    );
  }
}
