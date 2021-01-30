import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Sportivo/DashBoardSportivo.dart';
import 'package:social_fitness_app/Sportivo/Dashboard_SchedePreferite.dart';
import 'package:social_fitness_app/Sportivo/Following_Page.dart';
import 'package:social_fitness_app/Sportivo/Notifiche_page.dart';
import 'package:social_fitness_app/Sportivo/Profile_Sportivo.dart';
import 'package:social_fitness_app/Sportivo/SearchSP.dart';
import '../Bean/Utente.dart';


class homePageSP extends StatefulWidget {
  final Utente utente;
  homePageSP({Key key, this.utente}) : super(key: key);
  @override
  homePageStateSP createState() => homePageStateSP(utente: utente);
}

class homePageStateSP extends State<homePageSP> {

  var _fireStore = FirebaseFirestore.instance;
  List<String> pt=[];

  void messagesStream() async {
    await for (var snapshot in _fireStore.collection("users").snapshots()) {
      for (var message in snapshot.docs) {
        //print(message.data());
        if(message["Categoria"] == "Personal Trainer"){
          String nome = message["Nome"];
          String cognome = message["Cognome"];
          String completo=nome + " " + cognome;
          pt.add(completo);
        }
      }
    }
  }

  int _currentIndex = 0;
  final Utente utente;
  List<Widget> _children () => [DashBoardSportivo(utente:utente),FollowingPage(utente:utente),DashBoard_SchedePreferite(), NotifichePage()];
  homePageStateSP({Key key, this.utente});



  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _children( );
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
                builder: (context) => ProfileSP(utente:utente));
            Navigator.push(context, route); },
        ),
        title: Text("HelpYourWorkout",  style: TextStyle(fontSize: 14, color: Color(0xFFfc6a26))),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              _openFilterDialog();
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              messagesStream();
              showSearch(context: context, delegate: SearchSP(pt, utente:utente));
            },
          ),
        ],
      ),
      body: children[_currentIndex],
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
            icon: new Icon(Icons.people_rounded),
            title: new Text("Seguiti"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text("Schede"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.add_alert),
            title: new Text("Notifiche"),
          ),
        ],
      ),
    );
  }


  List<String> countList = [
    "Corsa/Camminata",
    "Ciclismo",
    "Yoga/Pilates",
    "Corpo Libero",
    "Personal Trainer",
    "06:00 - 09:00",
    "09:00 - 12:00",
    "12:00 - 15:00",
    "15:00 - 18:00",
    "18:00 - 21:00",
    "21:00 - 00:00",
  ];
  List<String> selectedCountList = [];

  void _openFilterDialog() async {
    await FilterListDialog.display(
        context,
        allTextList: countList,
        height: 500,
        borderRadius: 20,
        headlineText: "FILTRA GLI ALLENAMENTI",
        searchFieldHintText: "Cerca",
        selectedTextList: selectedCountList,
        onApplyButtonClick: (list) {
          if (list != null) {
            setState(() {
              selectedCountList = List.from(list);
            });
          }
          Navigator.pop(context);
        });
  }
}