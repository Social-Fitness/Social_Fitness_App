import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/Chat/login.dart';
import 'package:social_fitness_app/PersonalTrainer/CuorePage.dart';
import 'package:social_fitness_app/PersonalTrainer/Profilo_PT.dart';
import 'package:social_fitness_app/PersonalTrainer/SearchPT.dart';
import 'package:social_fitness_app/Sportivo/Selezione%20Sport.dart';
import 'Crea_Scheda_SenzaRichiesta.dart';
import 'DashBoardPT.dart';
import 'NotificheFollow.dart';
import 'SelezioneSportPT.dart';


class homePagePT extends StatefulWidget {

  Utente utente;
  homePagePT({Key key, this.utente}) : super(key: key);
  @override
  homePageStatePT createState() => homePageStatePT(utente: utente);
}

class homePageStatePT extends State<homePagePT> {
  Utente utente;
  homePageStatePT({Key key, this.utente});
  int _currentIndex = 0;
  List<Widget> _children() => [ DashBoardPT(utente:utente),CuorePage(utente:utente),SelezioneSportScreenPT(utente:utente),Notifiche_salva_follow_Page(utente:utente)];



  var _fireStore = FirebaseFirestore.instance;
  List<String> pt= [];

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

  @override
  Widget build(BuildContext context) {
    final List<Widget> children= _children();
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
                builder: (context) => ProfilePT(utente: utente) );
            Navigator.push(context, route); },
        ),
        title: Text("Social Fitness",  style: TextStyle(fontSize: 14, color: Color(0xFFfc6a26))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              print("CIAOOOO" + utente.categoria);
              Route route = MaterialPageRoute(
                  builder: (context) => LoginScreen(utente: utente));
              Navigator.push(context, route); },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              messagesStream();
              showSearch(context: context, delegate: SearchPT(pt,utente: utente));
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
           icon: new Icon(Icons.favorite),
           title: new Text("Schede"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.add),
           title: new Text("Crea"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.notification_important),
           title: new Text("Notifiche"),
         ),
       ],
     ),
    );
  }

}