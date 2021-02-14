import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_fitness_app/Bean/Seguiti.dart';
import 'package:social_fitness_app/Bean/Utente.dart';

import 'HomePageMenuSP.dart';

class FollowingPage extends StatefulWidget {
  Utente utente;
  FollowingPage({Key key, this.utente}): super(key:key);
  @override
  FollowingPageState createState() => FollowingPageState(utente: utente);
}

class FollowingPageState extends State<FollowingPage> {
  Utente utente;

  FollowingPageState({Key key, this.utente});

  final _fireStore = FirebaseFirestore.instance;
  List<Seguiti> following = [];
  String azione;
  String destinatario;


  void messagesStream() async {
    await for (var snapshot in _fireStore.collection("notify").snapshots()) {
      for (var message in snapshot.docs) {
        if (message["Mittente"] == utente.email) {
          azione = message["Azione"];
          destinatario = message["Destinatario"];
          Seguiti s = new Seguiti(utente.email, azione, destinatario);
          following.add(s);
        }
      }
    }

  }

  @override
  void initState() {
   // messagesStream();
    // TODO: implement initState
    super.initState();
  }


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
          itemCount: following.length,
          itemBuilder: (BuildContext context, int index) {
            return WidgetItem();
          }),
    );
  }

  Widget WidgetItem() {
    new Container(
        margin: EdgeInsets.only(top:10.0,bottom: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage("assets/image/icon.png"),
              backgroundColor: Colors.transparent,
            ),
            new Text("PT"),
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
  }
}



