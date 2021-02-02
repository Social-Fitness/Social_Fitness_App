import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/PersonalTrainer/Crea_Scheda_SenzaRichiesta.dart';

import 'HomePageMenuPT.dart';

//selezione sport pt

class SelezioneSportScreenPT extends StatefulWidget {
  Utente utente;
  SelezioneSportScreenPT({Key key,this.utente}) : super(key: key);
  @override
  SelezioneSportScreenStatePT createState() => SelezioneSportScreenStatePT(utente:utente);
}

class SelezioneSportScreenStatePT extends State<SelezioneSportScreenPT> {
  Utente utente;
  SelezioneSportScreenStatePT({Key key,this.utente});
  String sport;

  Widget _buildCorsaBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          sport="Corsa";
          Route route = MaterialPageRoute(
              builder: (context) =>AllenamentoCor_crea_Screen(utente:utente));
          Navigator.push(context, route);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.white,
        child: Text(
          'CORSA',
          style: TextStyle(
            color: Color(0xFFfc6a26),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
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
                          Text(
                            'SELEZIONA SPORT',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          SizedBox(height: 30.0),
                          Image(
                            image: AssetImage(
                              'assets/image/running.png',
                            ),
                            height: 150.0,
                            width: 150.0,
                          ),
                          _buildCorsaBtn(),
                          SizedBox(height: 30.0),
                          Image(
                            image: AssetImage(
                              'assets/image/bike.png',
                            ),
                            height: 200.0,
                            width: 200.0,
                          ),

                        ]
                    ),
                  ]
              ),
            )
        )
    );
  }
}