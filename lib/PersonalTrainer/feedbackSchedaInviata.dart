import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/Sportivo/HomePageMenuSP.dart';

class feedback extends StatefulWidget {

final Utente utente;
feedback({Key key, this.utente}) : super(key: key);
@override
feedbackState createState() => feedbackState(utente:utente);
}

class feedbackState extends State<feedback> {
  Utente utente;
  feedbackState({Key key, this.utente});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
          title: Center(
            child: Text('Invio con successo'),
    ),
    ),

          body: Center(
          child: Text(
    "OTTIMO,LA TUA SCHEDA E' STATA INVIATA",
    textAlign: TextAlign.center,
            style: TextStyle(
                inherit: true,
                fontSize: 48.0,
                color: Color(0xFF01579B),
                shadows: [
                  Shadow( // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Color(0xFF73AEF5),
                  ),
                  Shadow( // bottomRight
                      offset: Offset(1.5, -1.5),
                     color: Color(0xFF61A4F1),
                  ),
                  Shadow( // topRight
                      offset: Offset(1.5, 1.5),
                      color: Color(0xFF478DE0)
                  ),
                  Shadow( // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Colors.white
                  ),
                ]
            ),

    ),
          ),),);
  }


}