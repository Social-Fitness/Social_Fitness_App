import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_fitness_app/Bean/Seguiti.dart';
import 'package:social_fitness_app/Bean/Utente.dart';

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
  List<Seguiti> following=[];
  String azione;
  String destinatario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  void messagesStream() async {
    await for (var snapshot in _fireStore.collection("notify").snapshots()) {
      for (var message in snapshot.docs) {
        if (message["Mittente"] == utente.email) {
          azione = message["Azione"];
          destinatario = message["Destinatario"];
          Seguiti s=new Seguiti(utente.email, azione, destinatario);
          following.add(s);
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _body() {
    return new Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      child: new ListView.builder(
          itemCount: following.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/image/pt2.jpg"),
                      backgroundColor: Colors.transparent,
                    ),
                    new Text(destinatario), //Inserire nome personal trainer
                    new OutlineButton(
                      onPressed: () {},
                      child: new Text("Segui Già"),
                    ),
                  ],
                ));
           }
          //fine for
      ),
    );
  }
}