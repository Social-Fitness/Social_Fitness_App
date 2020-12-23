import 'package:flutter/material.dart';
import 'package:social_fitness_app/screens/home_pt.dart';


class DashBoardPT extends StatefulWidget {
  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoardPT> {
  int _currentIndex = 0;

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      HomeScreen(),
      Center(child: Text("Subscriptions")),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
    );
  }

}

