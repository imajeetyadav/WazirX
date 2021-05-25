import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../screen/alert_screen.dart';
import '../screen/home_screen.dart';
import 'feeds_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _page = 0;
  List<Widget> _navList = [
    HomeScreen(),
    AlertScreen(),
    FeedsScreen(),
  ];
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        key: _bottomNavigationKey,
        height: 50.0,
        backgroundColor: bgColor,
        color: secondaryColor,
        buttonBackgroundColor: secondaryColor,
        animationCurve: Curves.easeInOut,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.details, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: SafeArea(child: _navList[_page]),
    );
  }
}
