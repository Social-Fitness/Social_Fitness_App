import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/Sportivo/HomePageMenuSP.dart';
import 'package:social_fitness_app/utils/constants.dart';



class RichiestaCorsa extends StatefulWidget {
  String email;
  Utente utente;
  RichiestaCorsa({Key key, this.email, this.utente}) : super(key: key);
  @override
  RichiestaCorsaState createState() => RichiestaCorsaState(email:email, utente: utente);
}

class RichiestaCorsaState extends State<RichiestaCorsa> {
  String email;
  Utente utente;
  RichiestaCorsaState ({Key key, this.email, this.utente});

  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController _BPMController = new TextEditingController();
  TextEditingController _VelocitaController = new TextEditingController();
  TextEditingController _DisponibilitaController = new TextEditingController();
  TextEditingController _AltezzaController = new TextEditingController();
  TextEditingController _PesoController = new TextEditingController();
  String _obiettivoController;
  bool _validateBPM = false;
  bool _validateVelocita = false;
  bool _validateDisponibilita = false;
  bool _validateAltezza = false;
  bool _validatePeso = false;
  List<String> obiettivi = ['10', 'Mezza', 'Maratona', '30KM'];



  Widget _buildBPMTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'BPM',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _BPMController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.favorite,
                color: Color(0xFFfc6a26),
              ),
              hintText: 'Inserisci i BPM',
              errorText: _validateBPM ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVelocitaTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Velocità Sostenuta (Km/h)',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _VelocitaController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.directions_run,
                color: Color(0xFFfc6a26),
              ),
              hintText: 'Inserisci la velocità sostenuta',
              hintStyle: kHintTextStyle,
              errorText: _validateVelocita ? 'Il campo non può essere vuoto' : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDisponibilitaTF() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Disponibilità settimanale (Numero di giorni)',
          style: kLabelStyle,
          ),
        SizedBox(height: 10.0),
        Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
        child: TextField(
                controller: _DisponibilitaController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
        ),
                decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
          Icons.calendar_today,
          color: Color(0xFFfc6a26),
          ),
          hintText: 'Inserisci la disponibilità',
          errorText: _validateDisponibilita ? 'Il campo non può essere vuoto' : null,
          hintStyle: kHintTextStyle,
          ),
          ),
        ),
        ],
    );
  }

  Widget _buildAltezzaTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Altezza in cm',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _AltezzaController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.accessibility,
                color: Color(0xFFfc6a26),
              ),
              hintText: 'Inserisci la tua altezza',
              errorText: _validateAltezza ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildPesoTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Peso',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _PesoController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.accessibility,
                color: Color(0xFFfc6a26),
              ),
              hintText: 'Inserisci il tuo peso',
              hintStyle: kHintTextStyle,
              errorText: _validatePeso ? 'Il campo non può essere vuoto' : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildObiettivoTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Obiettivo',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0, ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: DropdownButton(
            icon: Icon(Icons.assistant_photo,color: Colors.white,),
            hint: Text('Seleziona l\'obiettivo'), // Not necessary for Option 1
            value: _obiettivoController,
            onChanged: (newValue) {
              setState(() {
                _obiettivoController = newValue;
              });
            },
            items: obiettivi.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }


  Widget _buildRichiediBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            int i=0;
            if(_BPMController.text.isEmpty)
              _validateBPM=true;
            else {
              _validateBPM = false;
              i++;
            }


            if(_VelocitaController.text.isEmpty)
              _validateVelocita=true;
            else {
              _validateVelocita = false;
              i++;
            }

            if(_DisponibilitaController.text.isEmpty)
              _validateDisponibilita=true;
            else {
              _validateDisponibilita = false;
              i++;
            }

            if (_AltezzaController.text.isEmpty)
              _validateAltezza = true;
            else {
              _validateAltezza=false;
              i++;
            }

            if(_PesoController.text.isEmpty)
              _validatePeso=true;
            else {
              _validatePeso = false;
              i++;
            }




            if(i==5) {
              _insertToDb();
              _buildPopupTF(context);
            }

          });

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Richiedi Scheda',
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

  _buildPopupTF(context) {
    return Alert(
        context: context,
        title: "SCHEDA RICHIESTA!",
        content:
        DialogButton(
          onPressed: () {
            _insertToDb();
            Route route = MaterialPageRoute(
                builder: (context) => homePageSP(utente:utente));
            Navigator.push(context, route);
          },
          child: Text(
            "OK!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
    ).show();
  }

  _insertToDb() {
    firestoreInstance.collection("richiesta_scheda").add(
        {
          "Sport": "Corsa",
          "BPM": _BPMController.text,
          "Velocita_Sostenuta": _VelocitaController.text,
          "Disponibilita_settimanale": _DisponibilitaController.text,
          "Altezza": _AltezzaController.text,
          "Peso": _PesoController.text,
          "Obiettivo": _obiettivoController,
          "Utente": utente.email,
          "Personal_Trainer": email,
        }).then((value){
      print(value.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Richiesta Scheda', style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: (){
          Route route = MaterialPageRoute(
              builder: (context) =>homePageSP(utente: utente));
          Navigator.push(context, route);
        }),
      ),
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
                        'RICHIESTA SCHEDA',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}