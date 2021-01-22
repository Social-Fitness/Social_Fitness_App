import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/CambioPW.dart';
import 'package:social_fitness_app/DashBoardSportivo.dart';
import 'package:social_fitness_app/Login_Page.dart';
import 'package:social_fitness_app/widgets/Dashboard_SchedePreferite.dart';
import 'package:social_fitness_app/widgets/Following_Page.dart';
import 'package:social_fitness_app/widgets/Notifiche_page.dart';
import 'package:social_fitness_app/widgets/Profile_Sportivo.dart';

import 'widgets/Search.dart';


class homePageSP extends StatefulWidget {
  @override
  homePageStateSP createState() => homePageStateSP();
}

class homePageStateSP extends State<homePageSP> {
  List<String> example=["uno", "due","tre"];
  int _currentIndex = 0;
  final List<Widget> _children = [DashBoardSportivo(),FollowingPage(),DashBoard_SchedePreferite(), NotifichePage()];

  final String _collection = 'users';
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  String nome = "";
  String cognome = "";
  String email = "";
  String dataNascita = "";
  String cellulare = "";

  void messagesStream() async {
    await for (var snapshot in _fireStore.collection(_collection).snapshots()) {
      for (var message in snapshot.docs) {
        //print(message.data());
        if(message["Email"] == "alicevid99@gmail.com"){
          nome = message["Nome"];
          cognome = message["Cognome"];
          email = message["Email"];
          dataNascita=message["Data_Di_Nascita "];
          cellulare=message["Cellulare"];
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    messagesStream();
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
            messagesStream();
            Route route = MaterialPageRoute(
                builder: (context) => ProfileSP(nome: nome,cognome: cognome,email: email,dataNascita: dataNascita,cellulare: cellulare));
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
              showSearch(context: context, delegate: Search(example));
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