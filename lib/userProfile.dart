import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/widgets/card_item.dart';
import 'package:social_fitness_app/widgets/stack_container.dart';

class userProfile extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends State<userProfile> {

  int _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StackContainer(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CardItem(),
              shrinkWrap: true,
              itemCount: 6,
            )
          ],
        ),
      ),
    );
  }
}