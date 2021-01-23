import 'package:flutter/material.dart';
import 'package:social_fitness_app/widgets/Profile_Sportivo.dart';
import 'package:social_fitness_app/widgets/Richiesta_schede.dart';
import 'package:social_fitness_app/widgets/Search_Bar.dart';
import 'Bean/Utente.dart';
import 'DashBoardPT.dart';

import 'widgets/Search.dart';


class homePagePT extends StatefulWidget {

  final Utente utente;
  homePagePT({Key key, this.utente}) : super(key: key);
  @override
  homePageStatePT createState() => homePageStatePT(utente: utente);
}

class homePageStatePT extends State<homePagePT> {
  int _currentIndex = 0;
  final List<Widget> _children = [ DashBoardPT(), null,RichiestaSchedePage(), SearchBar()];

  final Utente utente;
  homePageStatePT({Key key, this.utente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF01579B),
          size: 30,
        ),
        leading: IconButton(
          icon:Icon(Icons.menu),
          onPressed: () {
            Route route = MaterialPageRoute(
                builder: (context) => ProfileSP(utente: utente) );
            Navigator.push(context, route); },
        ),
        title: Text("HelpYourWorkout",  style: TextStyle(fontSize: 14, color: Color(0xFFfc6a26))),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              List<String> example=["uno", "due","tre"];
              showSearch(context: context, delegate: Search(example));
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
                _showPopupMenu();
            },
          ),
        ],
      ),
     body: _children[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       onTap: (value) {
         // Respond to item press.
         setState(() => _currentIndex = value);
       },
       currentIndex: _currentIndex,
       selectedItemColor: Color(0xFFfc6a26),
       unselectedItemColor: Color(0xFF01579B),
       selectedFontSize: 15,
       unselectedFontSize: 15,
       items: [
         new BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text("Home"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.favorite),
           title: new Text("Schede"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.add_alert),
           title: new Text("Richieste"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.search),
           title: new Text("Cerca"),

         ),
       ],
     ),
    );
  }

_showPopupMenu() {
  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
    color: Colors.white,
    items: [
      PopupMenuItem<String>(
          child: const Text('Visualizza In Ordine Crescente'), value: '1', textStyle: TextStyle(fontSize: 14, color: Color(0xFF01579B))),
      PopupMenuItem<String>(
          child: const Text('Visualizza In Ordine Decrescente'), value: '2', textStyle: TextStyle(fontSize: 14, color: Color(0xFF01579B))),
    ],
    elevation: 8.0,
  )
      .then<void>((String itemSelected) {
    if (itemSelected == null) return;

    if (itemSelected == "1") {
      //code here
    } else if (itemSelected == "2") {
      //code here
    }
  });
}

}