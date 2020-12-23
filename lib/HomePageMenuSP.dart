import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/DashBoardSportivo.dart';


class homePageSP extends StatefulWidget {
  homePageSP({Key key, this.title}) : super(key: key);
  final String title;
  @override
  homePageStateSP createState() => homePageStateSP();
}
class homePageStateSP extends State<homePageSP> {
  int selectedPage = 0;
  final _pageOptions = [DashBoardSportivo(),DashBoardSportivo()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.article_sharp, title: 'Allenamenti'),
          TabItem(icon: Icons.person, title: 'Profilo'),
        ],
        backgroundColor: Color(0xFFfc6a26),
        color: Color(0xFF01579B),
        initialActiveIndex: 0,//optional, default as 0
        onTap: (int i ){
          setState(() {
            selectedPage = i;
          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}