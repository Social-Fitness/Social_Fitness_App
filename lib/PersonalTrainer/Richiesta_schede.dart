import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/PersonalTrainer/SchedaRichiesta2.dart';
import 'package:social_fitness_app/PersonalTrainer/allenamento_corsa.dart';

class RichiestaSchedePage extends StatefulWidget {
  final Utente utente;
  RichiestaSchedePage({Key key, this.utente}) : super(key: key);
  @override
  RichiestaSchedePageState createState() => RichiestaSchedePageState(utente: utente);
}

class RichiestaSchedePageState extends State<RichiestaSchedePage> {
  Utente utente;
  RichiestaSchedePageState({Key key, this.utente});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return new Container(
      margin: EdgeInsets.only(left: 5.0,right: 5.0),
      child: new ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                margin: EdgeInsets.only(top:10.0,bottom: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                        CircleAvatar(
                        radius: 18.0,
                        backgroundImage: AssetImage("assets/image/pt1.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                    new Text("Utente ${index+1} Ha richiesto una scheda per la \n " + "Corsa"), //Far uscire nome Pt al posto di PT+numero
                    GestureDetector(
                      onTap:() {
                      print("CLICK SU SCHEDA");
                      Route route = MaterialPageRoute(
                          builder: (context) => SchedaRichiesta2(utente:utente));
                      Navigator.push(context, route);
                  },
                    child: Image.asset("assets/image/create_scheda.png",height: 35.0,),
                ),
                  ],
                ),
            );
          }),
    );
  }
}