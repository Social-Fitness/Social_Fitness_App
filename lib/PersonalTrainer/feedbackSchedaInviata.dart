import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/Sportivo/HomePageMenuSP.dart';

import 'HomePageMenuPT.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Social Fitness",
            style: TextStyle(fontSize: 14, color: Color(0xFFfc6a26))),
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
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      'assets/image/checked.png',
                    ),
                    height: 150.0,
                    width: 150.0,
                  ),
                  SizedBox(height: 30.0),
                  SizedBox(height: 30.0),
                  Text(
                    'Ottimo, la tua scheda è stata inviata',textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  SizedBox(height: 30.0),
                  _buildHomeBtn()
                ]
            ),
          ]
      ),
    );
  }

    Widget _buildHomeBtn() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            Route route = MaterialPageRoute(
                builder: (context) => homePagePT(utente: utente,));
            Navigator.push(context, route);
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          color: Colors.white,
          child: Stack(
              children: <Widget>[
                Text(
                  'Torna alla Home',
                  style: TextStyle(
                    color: Color(0xFFfc6a26),
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ]
          ),
        ),
      );
    }
  }