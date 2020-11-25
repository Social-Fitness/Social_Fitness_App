import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:social_fitness_app/HomePageMenu.dart';
import 'package:social_fitness_app/utils/constants.dart';

class PianificaAttivitaUtScreen extends StatefulWidget {
  @override
  PianificaAttivitaUtScreenState createState() => PianificaAttivitaUtScreenState();
}

class PianificaAttivitaUtScreenState extends State<PianificaAttivitaUtScreen> {
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController _nomeController = new TextEditingController();
  TextEditingController _dataController = new TextEditingController();
  TextEditingController _oraController = new TextEditingController();
  TextEditingController _cittaController = new TextEditingController();
  TextEditingController _indirizzoController = new TextEditingController();
  bool _validateNome = false;
  bool _validateData = false;
  bool _validateCitta = false;
  bool _validateIndirizzo = false;
  bool _validateOra = false;


  Widget _buildNomeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nome Attività',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _nomeController,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.directions_run,
                color: Colors.white,
              ),
              hintText: 'Inserisci il Nome dell\'attività',
              errorText: _validateNome ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Data (GG-MM-AAAAA)',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _dataController,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              hintText: 'Inserisci la Data',
              errorText: _validateData ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOraTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ora (HH:mm)',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _oraController,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.watch_later_outlined,
                color: Colors.white,
              ),
              hintText: 'Inserisci l\'Ora',
              errorText: _validateOra ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCittaTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Città',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _cittaController,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.location_city,
                color: Colors.white,
              ),
              hintText: 'Inserisci la Città',
              errorText: _validateCitta ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndirizzoTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Indirizzo (via, CAP)',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _indirizzoController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.add_location_alt,
                color: Colors.white,
              ),
              hintText: 'Inserisci l\'indirizzo',
              errorText: _validateIndirizzo ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildCreaBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            int i=0;
            if(_nomeController.text.isEmpty)
              _validateNome=true;
            else
              i++;


            if(_dataController.text.isEmpty)
              _validateData=true;
            else
              i++;


            if(_oraController.text.isEmpty)
              _validateOra=true;
            else
              i++;

            if(_cittaController.text.isEmpty)
              _validateCitta=true;
            else
              i++;


            if(_indirizzoController.text.isEmpty)
              _validateIndirizzo=true;
            else
              i++;


            if(i==5)
              _buildPopupTF(context);

          });
  },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Crea',
          style: TextStyle(
            color: Color(0xFF527DAA),
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
        title: "NUOVA ATTIVITÀ CREATA!",
        content:
        DialogButton(
          onPressed: () {
            _insertToDb();
            Route route = MaterialPageRoute(
                builder: (context) => homePage());
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
    firestoreInstance.collection("activity_host").add(
        {
          "Nome" : _nomeController.text,
          "Data" : _dataController.text,
          "Ora ": _oraController.text,
          "Città" : _cittaController.text,
          "Indirizzo" : _indirizzoController.text,

        }).then((value){
      print(value.id);
    });
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
                        'PIANIFICA UNA NUOVA ATTIVITÀ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildNomeTF(),
                      SizedBox(height: 10.0),
                      _buildDataTF(),
                      SizedBox(height: 10.0),
                      _buildOraTF(),
                      SizedBox(height: 10.0,),
                      _buildCittaTF(),
                      SizedBox(height: 10.0),
                      _buildIndirizzoTF(),
                      _buildCreaBtn()
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