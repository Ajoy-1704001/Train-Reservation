import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trainapp/screens/home.dart';
import 'package:trainapp/utilities/apptheme.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var screens = [const Home(), const Home(), const Home(), const Home()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          selectedIconTheme: IconThemeData(color: AppTheme.btnP),
          unselectedIconTheme: IconThemeData(color: AppTheme.secondary),
          elevation: 0,
          backgroundColor: AppTheme.bg,
          onTap: (value) => setState(() {
                currentIndex = value;
              }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "home",
                activeIcon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline_rounded),
                label: "train",
                activeIcon: Icon(Icons.bookmark)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.confirmation_number_outlined,
                ),
                label: "train",
                activeIcon: Icon(Icons.confirmation_number_rounded)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: "train",
                activeIcon: Icon(Icons.settings))
          ]),
    );
  }
}
