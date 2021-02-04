import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/Sportivo/scheda_dettaglio_Sportivo.dart';

class NotifichePage extends StatefulWidget {
  final Utente utente;
  NotifichePage({Key key, this.utente}) : super(key: key);


  @override
  NotifichePageState createState() => NotifichePageState(utente:utente);
}

class NotifichePageState extends State<NotifichePage> {
  Utente utente;
  NotifichePageState({Key key, this.utente});
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
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/image/pt1.jpg"),
                      backgroundColor: Colors.transparent,
                    ),
                    new Text("PT${index+1} Ha aggiunto una nuova scheda"),
                    ClipOval(
                      child: Material(
                        color: Colors.white, // button color
                        child: InkWell(
                          splashColor: Color(0xFFfc6a26), // inkwell color
                          child: SizedBox(width: 56, height: 56, child: Icon(Icons.airplay)),
                          onTap: () {
                            //Quando si fa il backand collegare scheda visualizzata con il dettaglip preciso
                          },
                        ),
                      ),
                    )//Far uscire nome Pt al posto di PT+numero
                  ],
                ));
          }),
    );
  }
}