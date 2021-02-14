import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_fitness_app/Bean/Seguiti.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/PersonalTrainer/ResocontoSchedaRichiesta.dart';
import 'package:social_fitness_app/Sportivo/Profilo_Accessibile_PT.dart';


class CuorePage extends StatefulWidget {
  Utente utente;
  CuorePage({Key key, this.utente}): super(key:key);
  @override
  CuorePagePageState createState() => CuorePagePageState(utente: utente);
}

class CuorePagePageState extends State<CuorePage> {
  Utente utente;

  CuorePagePageState({Key key, this.utente});

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
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                margin: EdgeInsets.only(top:10.0,bottom: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PublicProfileAcessPTPage(utente: utente,nome: "Alice",cognome:"Vidoni",email: "alicevid99gmail.com"));
                        Navigator.push(context, route);
                      },
                      child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/image/icon.png"),
                      backgroundColor: Colors.transparent,
                    ),
                    ),
                    new Text("Alice Vidoni ha richiesto una Scheda"),//"//Lo sportivo ha salvato la scheda ${index+1} "),
                    ClipOval(
                      child: Material(
                        color: Colors.white, // button color
                        child: InkWell(
                          splashColor: Color(0xFFfc6a26), // inkwell color
                          child: SizedBox(width: 56, height: 56, child: Icon(Icons.video_library_rounded)),
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => ResocontoPage());
                            Navigator.push(context, route);
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