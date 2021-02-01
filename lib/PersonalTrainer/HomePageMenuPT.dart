import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/PersonalTrainer/Profilo_PT.dart';
import 'package:social_fitness_app/PersonalTrainer/Richiesta_schede.dart';
import 'package:social_fitness_app/PersonalTrainer/SearchPT.dart';
import 'Crea_Scheda_SenzaRichiesta.dart';
import 'DashBoardPT.dart';


class homePagePT extends StatefulWidget {

  final Utente utente;
  homePagePT({Key key, this.utente}) : super(key: key);
  @override
  homePageStatePT createState() => homePageStatePT(utente: utente);
}

class homePageStatePT extends State<homePagePT> {
  final Utente utente;
  homePageStatePT({Key key, this.utente});
  int _currentIndex = 0;
  List<Widget> _children() => [ DashBoardPT(utente:utente), null, AllenamentoCor_crea_Screen(utente:utente), RichiestaSchedePage(utente:utente)];



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
        title: Text("HelpYourWorkout",  style: TextStyle(fontSize: 14, color: Color(0xFFfc6a26))),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              messagesStream();
              showSearch(context: context, delegate: SearchPT(pt));
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
           icon: new Icon(Icons.add_alert),
           title: new Text("Notifiche"),
         ),
       ],
     ),
    );
  }

}