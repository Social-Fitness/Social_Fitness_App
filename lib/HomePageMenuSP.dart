import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/DashBoard.dart';
import 'userProfile.dart';
import 'Allenamento_Ciclismo.dart';


class homePageSP extends StatefulWidget {
  homePageSP({Key key, this.title}) : super(key: key);
  final String title;
  @override
  homePageStateSP createState() => homePageStateSP();
}
class homePageStateSP extends State<homePageSP> {
  int selectedPage = 0;
  final _pageOptions = [DashBoard(),userProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.article_sharp, title: 'Allenamenti'),
          TabItem(icon: Icons.person, title: 'Profilo'),
        ],
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