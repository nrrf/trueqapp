import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:trueqapp/screens/user/profile_page.dart';
import 'package:trueqapp/utilities/constants.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    // details of tab bar with Cupertino: https://medium.com/flutter-community/add-a-tab-bar-and-navigation-bar-with-ios-style-in-your-next-flutter-app-bf97b1e27e3a
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: kAccentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "My Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            builder: (BuildContext context) => MyFirstTab(),
          );
        } else if (index == 1) {
          return CupertinoTabView(
            builder: (BuildContext context) => MySecondTab(),
          );
        } else {
          return CupertinoTabView(
            builder: (BuildContext context) => ProfilePage(),
          );
        }
      },
    );
  }
}

class MyFirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tab 1"),
      ),
    );
  }
}

class MySecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tab 2"),
      ),
    );
  }
}

