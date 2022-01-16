import 'package:conversate_app/screens/games_page.dart';
import 'package:conversate_app/screens/home_screen.dart';
import 'package:conversate_app/screens/profile_screen.dart';
import 'package:conversate_app/screens/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _page = 0;

  List pages = [
    {
      'title': 'Home',
      'icon': './lib/assets/icons/home.svg',
      'page': HomeScreen(),
      'index': 0,
    },
    {
      'title': 'Games',
      'icon': './lib/assets/icons/controller.svg',
      'page': GamesScreen(),
      'index': 1,
    },
    {
      'title': 'Tasks',
      'icon': './lib/assets/icons/tasks.svg',
      'page': TasksScreen(),
      'index': 2,
    },
    {
      'title': 'Profile',
      'icon': './lib/assets/icons/profile.svg',
      'page': ProfileScreen(),
      'index': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page]['page'],
      bottomNavigationBar: Material(
        elevation: 15,
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (Map item in pages)
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      item['icon'],
                      height: MediaQuery.of(context).size.height / 33,
                      width: MediaQuery.of(context).size.width / 4,
                      color: item['index'] != _page
                          ? Colors.grey
                          : Theme.of(context).accentColor,
                    ),
                  ),
                  onTap: () => navigationTapped(item['index']),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    setState(
      () {
        _page = page;
      },
    );
  }
}
