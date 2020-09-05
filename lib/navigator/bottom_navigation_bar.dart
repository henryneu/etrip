import 'package:etrip/pages/home_page.dart';
import 'package:etrip/pages/mine_page.dart';
import 'package:etrip/pages/search_page.dart';
import 'package:etrip/pages/trip_page.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  final PageController _pageController = PageController(initialPage: 0);

  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _pageChange(int index) {
    setState(() {
      if (_curIndex != index) {
        _curIndex = index;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: _pageChange,
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TripPage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _curIndex = index;
          });
        },
        currentIndex: _curIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("首页",
                style: TextStyle(
                    color: _curIndex != 0 ? _defaultColor : _activeColor)),
            icon: Icon(Icons.home, color: _defaultColor),
            activeIcon: Icon(Icons.home, color: _activeColor),
          ),
          BottomNavigationBarItem(
            title: Text("搜索",
                style: TextStyle(
                    color: _curIndex != 1 ? _defaultColor : _activeColor)),
            icon: Icon(Icons.search, color: _defaultColor),
            activeIcon: Icon(Icons.search, color: _activeColor),
          ),
          BottomNavigationBarItem(
            title: Text("旅拍",
                style: TextStyle(
                    color: _curIndex != 2 ? _defaultColor : _activeColor)),
            icon: Icon(Icons.camera_alt, color: _defaultColor),
            activeIcon: Icon(Icons.camera_alt, color: _activeColor),
          ),
          BottomNavigationBarItem(
            title: Text("我的",
                style: TextStyle(
                    color: _curIndex != 3 ? _defaultColor : _activeColor)),
            icon: Icon(Icons.account_circle, color: _defaultColor),
            activeIcon: Icon(Icons.account_circle, color: _activeColor),
          ),
        ],
      ),
    );
  }
}
