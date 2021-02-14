import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';

import 'HomePageMenuPT.dart';

class modificaButton extends StatefulWidget {
  final Utente utente;
  modificaButton({Key key, this.utente}) : super(key: key);
  @override
  modificaButtonState createState() => modificaButtonState(utente:utente);
}

class modificaButtonState extends State<modificaButton> {
  Utente utente;
  modificaButtonState({Key key, this.utente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Modifica Scheda', style: TextStyle(color: Colors.black),),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
            onPressed: () {
              Route route = MaterialPageRoute(
                  builder: (context) => homePagePT(utente: utente));
              Navigator.push(context, route);
            }),
        ),
        body: Stack(
          children: <Widget>[
          Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF01579B),
          ],
              stops: [0.1, 0.4, 0.7, 0.9],
          ),
          ),
          ),
        ],
    ),
    );
  }
}