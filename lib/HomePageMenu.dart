import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/pianifica_att_pt.dart';
import 'package:social_fitness_app/pianifica_att_utente.dart';
import 'userProfile.dart';

import 'MapPage.dart';


class homePage extends StatefulWidget {
  homePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  homePageState createState() => homePageState();
}
class homePageState extends State<homePage> {
  int selectedPage = 1;
  final _pageOptions = [PianificaAttivitaUtScreen(),MapPage(),userProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.watch, title: 'Pianifica Attività'),
          TabItem(icon: Icons.add_location, title: 'Mappa'),
          TabItem(icon: Icons.person, title: 'Profilo'),
        ],
        initialActiveIndex: 1,//optional, default as 0
        onTap: (int i ){
          setState(() {
            selectedPage = i;
          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}