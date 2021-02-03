import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/RichiestaScheda.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'HomePageMenuPT.dart';


/*DEVE ESSERE PRESO IN INPUT L'EMAIL DALLA PAGINA PRECEDENTE DOPO CHE LA COLLEGHIAMO*/
class SchedaRichiesta2 extends StatefulWidget {
  final Utente utente;
  SchedaRichiesta2({Key key, this.utente}) : super(key: key);
  @override
  SchedaRichiesta2State createState() => SchedaRichiesta2State(utente: utente);
}


class SchedaRichiesta2State extends State<SchedaRichiesta2> {
  Utente utente;

  SchedaRichiesta2State({Key key, this.utente});

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  RichiestaScheda _richiestaScheda;

  void messagesStream() async {
    await for (var snapshot in _fireStore.collection("richiesta_scheda").snapshots()) {
      for (var message in snapshot.docs) {
        if(message["Personal_Trainer"] == utente.email && message["Utente"]=="alicevid99@gmail.com"){
          _richiestaScheda.bpm = message["BPM"];
          _richiestaScheda.altezza= message["Altezza"];
          _richiestaScheda.disponibilita_settimanale=message["Disponibilita_settimanale"];
          _richiestaScheda.obiettivo=message["Obiettivo"];
          _richiestaScheda.pt=message["Personal_Trainer"];
          _richiestaScheda.peso=message["Peso "];
          _richiestaScheda.sport=message["Sport"];
          _richiestaScheda.richiedente=message["Utente"];
          _richiestaScheda.velocita_sostenuta=message["Velocita_Sostenuta"];
        }
      }
    }
  }

  Widget _buildBPMTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'BPM ' + _richiestaScheda.bpm,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildVelocitaTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Velocità sostenuta: ' + _richiestaScheda.velocita_sostenuta,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildDisponibilitaTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Disponibilità settimanale: ' + _richiestaScheda.disponibilita_settimanale,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildAltezzaTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Altezza: ' + _richiestaScheda.altezza + ' cm',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }


  Widget _buildPesoTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Peso: ' + _richiestaScheda.peso + ' Kg',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildObiettivoTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Obiettivo ' + _richiestaScheda.obiettivo,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

/*FARE 2 BOTTONI COME HA DETTO PIETRO, UNO CHE TORNA ALLE RICHIESTE E UNO CHE VA AVANTI. IN QUELLO CHE VA AVANTI PASSARE SIA UTENTE CHE RICHIESTA CREATA SOPRA */
  Widget _buildRichiediBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {}
          );
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Compila Scheda',
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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Richiesta Scheda', style: TextStyle(color: Colors.black),),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
            onPressed: () {
              Route route = MaterialPageRoute(
                  builder: (context) => homePagePT(utente: utente));
              Navigator.push(context, route);
            }),
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
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 80.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'COMPILA SCHEDA',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _buildBPMTF(),
                  SizedBox(height: 10.0),
                  _buildVelocitaTF(),
                  SizedBox(height: 10.0),
                  _buildDisponibilitaTF(),
                  SizedBox(height: 10.0,),
                  _buildAltezzaTF(),
                  SizedBox(height: 10.0),
                  _buildPesoTF(),
                  SizedBox(height: 10.0),
                  _buildObiettivoTF(),
                  _buildRichiediBtn()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
