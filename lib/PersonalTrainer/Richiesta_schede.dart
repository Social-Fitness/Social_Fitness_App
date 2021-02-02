import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
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
                      _showMyDialog();
                  },
                    child: Image.asset("assets/image/create_scheda.png",height: 35.0,),
                ),
                  ],
                ),
            );
          }),
    );
  }


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(
            "NOME UTENTE",
            style: TextStyle(
              color: Color(0xFFfc6a26),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "DATI INSERITI DALL'UTENTE",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('CREA'),
              onPressed: () {
                //if è stato richiesto corsa o ciclismo apri form corretto
               Route route = MaterialPageRoute(
                    builder: (context) => AllenamentoCorScreen(utente:utente));
                Navigator.push(context, route);
              },
            ),

          ],
        );
      },
    );
  }
}