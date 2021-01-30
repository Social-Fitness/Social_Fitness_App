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
  final List<Widget> _children = [DashBoardSportivo(),FollowingPage(),DashBoard_SchedePreferite(), NotifichePage()];
  final Utente utente;
  homePageStateSP({Key key, this.utente});



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
                builder: (context) => ProfileSP(utente:utente));
            Navigator.push(context, route); },
        ),
        title: Text("HelpYourWorkout",  style: TextStyle(fontSize: 14, color: Color(0xFFfc6a26))),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
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



  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Filtraggio Schede'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("In questo momento le uniche schede disponibili sono quelle per gli allenamenti di corsa!"),
          Text("\n"),
          Text("Ciclismo - COMING SOON"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Chiudi'),
        ),
      ],
    );
  }
}