import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/SelezioneCicCor.dart';
import 'userProfile.dart';
import 'allenamento_ciclismo.dart';
import 'MapPage.dart';


class homePagePT extends StatefulWidget {
  homePagePT({Key key, this.title}) : super(key: key);
  final String title;
  @override
  homePageStatePT createState() => homePageStatePT();
}
class homePageStatePT extends State<homePagePT> {
  int selectedPage = 1;
  final _pageOptions = [PianificaAttivitaPTScreen(),SelezioneSportScreen(),userProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.article_sharp, title: 'Allenamenti'),
          TabItem(icon: Icons.add_circle, title: 'Crea Allenamento'),
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