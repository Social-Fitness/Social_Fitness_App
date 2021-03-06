import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/Chat/login.dart';
import 'package:social_fitness_app/PersonalTrainer/SchedePublic.dart';
import 'package:social_fitness_app/Sportivo/HomePageMenuSP.dart';
import 'package:social_fitness_app/Sportivo/Richiesta_Schede_Corsa.dart';
import 'package:social_fitness_app/Sportivo/Selezione%20Sport.dart';


//IN QUESTA CLASSE APPARE IL PERSONAL TRAINER QUANDO LO SI RICERCA DALLA BARRA DELLO SPORTIVO
class PublicProfilePage extends StatefulWidget {
  String nome;
  Utente utente;
  PublicProfilePage({Key key, this.nome, this.utente}): super(key:key);
  @override
  PublicProfilePageState createState() => new PublicProfilePageState(nome: nome, utente:utente);
}

class PublicProfilePageState extends State<PublicProfilePage> with SingleTickerProviderStateMixin {
  TabController tabController;
  String follow=" ";
  bool exist;
  String nome;
  Utente utente;

  PublicProfilePageState({Key key, this.nome, this.utente});

  final _fireStore = FirebaseFirestore.instance;
  String cognome = "";
  String cellulare = "";
  String email = "";
  String img_profilo = "";

  void messagesStream() async {
    await for (var snapshot in _fireStore.collection("users").snapshots()) {
      for (var message in snapshot.docs) {
        //print(message.data());
        String s = message["Nome"] + " " + message["Cognome"];
        if (s.compareTo(nome) == 0) {
          email = message["Email"];
          cellulare = message["Cellulare"];
          img_profilo = message["ImgProfilo"];
          nome = message["Nome"];
          cognome = message["Cognome"];
        }
      }
    }
  }

  void controlInDB() async {
    await for (var snapshot in _fireStore.collection("notify").snapshots()) {
      for (var message in snapshot.docs) {
        //print(message.data());
        if (message["Mittente"] == utente.email &&
            message["Destinatario"] == email) {
          exist = true;
          follow = "Segui già";
          print("ciao alice funziono");
        }
        else {
          exist = false;
          follow = "Segui";
        }
      }
    }
  }

  @override
  void initState() {
    controlInDB();
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    messagesStream();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Profilo Personal Trainer', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w200),),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (context) => homePageSP(utente: utente));
                Navigator.push(context, route);
              }),
        ),
        body: ListView(

          children: <Widget>[
            Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(image: AssetImage(
                                'assets/image/profile.png'),
                                fit: BoxFit.cover

                            )
                        ),
                      ),
                    ),

                  ),

                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(

                children: <Widget>[
                  SizedBox(height: 20),
                  Text(nome + " " + cognome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF01579B),
                    ),
                  ),
                  SizedBox(height: 10, child: Container(
                    color: Colors.white,
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.email, size: 17,),
                      Text(email,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black.withOpacity(0.6)
                        ),)

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15, child: Container(
              color: Colors.white,
            ),),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    height: 70,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF01579B),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            spreadRadius: 2,
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('10',
                              style: TextStyle(fontSize: 14,
                                  color: Colors.white),),
                            SizedBox(height: 5,),
                            Text('Followers', style: TextStyle(fontSize: 14,
                                color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildChatBtn(),
                  _buildSeguiBtn(),
                  _buildRichiesraBtn()
                ],
              ),
            ),
            SizedBox(height: 5,),
            SizedBox(height: 20, child: Container(
              color: Color(0xFF01579B).withOpacity(0.2),
            ),),
            Container(
              color: Colors.white,
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Color(0xFFfc6a26).withOpacity(0.5),
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text('Pagina 1', style: TextStyle(fontSize: 20),),
                  ),
                  Tab(
                    child: Text('Pagine 2', style: TextStyle(fontSize: 20),),

                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 450.0,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  new SchedePublic(),
                  new SchedePublic(),
                ],
              ),
            ),

          ],
        )
    );
  }


  Widget _buildRichiesraBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Route route = MaterialPageRoute(
              builder: (context) => RichiestaCorsa(utente:utente));
          Navigator.push(context, route);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        color: Color(0xFFfc6a26),
        child: Text("Richiedi Scheda",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildChatBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Route route = MaterialPageRoute(
              builder: (context) => LoginScreen(utente:utente));
          Navigator.push(context, route);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFFfc6a26),
        child: Text("Avvia Chat",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }


  Widget _buildSeguiBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          changeworld();
          if (follow == "Segui") {
            _deleteseguiToDb();
          }
          else
            _insertToDb();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFFfc6a26),
        child: Text(
          follow,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }



  _deleteseguiToDb() {
    FirebaseFirestore.instance
        .collection("notify")
        .where("Mittente", isEqualTo: utente.email)
        .where("Destinatario", isEqualTo: email)
        .get().then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance.collection("notify").doc(element.id)
            .delete()
            .then((value) {
          print("Notify Success!");
        });
      });
    });
  }

  void changeworld() {
    if (follow == "Segui") {
      setState(() {
        follow = "Segui già";
      });
    }
    else {
      setState(() {
        follow = "Segui";
      });
    }
  }


  _insertToDb() {
    _fireStore.collection("notify").add(
        {
          "Mittente": utente.email,
          "Azione": "segue",
          "Destinatario": email,

        }).then((value) {
      print(value.id);
    });
  }

}