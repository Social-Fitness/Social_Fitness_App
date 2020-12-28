import 'package:flutter/material.dart';
import 'package:social_fitness_app/screens/home_pt.dart';
import 'package:social_fitness_app/screens/home_sportivo.dart';


class DashBoardSportivo extends StatefulWidget {
  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoardSportivo> {
  int _currentIndex = 0;

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      HomeScreenSportivo(),
      Center(child: Text("Subscriptions")),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
    );
  }
}

