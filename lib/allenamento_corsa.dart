import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:social_fitness_app/HomePageMenuPT.dart';
import 'package:social_fitness_app/utils/constants.dart';
import 'package:social_fitness_app/widgets/Richiesta_schede.dart';

class AllenamentoCorScreen extends StatefulWidget {
  @override
  AllenamentoCorScreenState createState() => AllenamentoCorScreenState();
}

class AllenamentoCorScreenState extends State<AllenamentoCorScreen> {
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController _BPMController = new TextEditingController();
  TextEditingController _kmController = new TextEditingController();
  TextEditingController _pendenzaController = new TextEditingController();
  String _obiettivoController;
  bool _validateBPM = false;
  bool _validatekm = false;
  bool _validatePendenza = false;

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
              hintText: 'Inserisci i BPM',
              errorText: _validateBPM ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKMTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'KM',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _kmController,
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
              hintText: 'Inserisci i km',
              errorText: _validatekm ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPendenzaTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Pendenza',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _pendenzaController,
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
              hintText: 'Inserisci pendenza',
              errorText: _validatePendenza ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
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
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: DropdownButton(
              hint: Text('Please choose a location'), // Not necessary for Option 1
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

    Widget _buildCreaBtn() {
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
            else
              i++;

            if(_kmController.text.isEmpty)
              _validatekm=true;
            else
              i++;

            if(_pendenzaController.text.isEmpty)
              _validatePendenza=true;
            else
              i++;



            if(i==3)
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
        title: "NUOVA SCHEDA CREATA!",
        content:
        DialogButton(
          onPressed: () {
            _insertToDb();
            Route route = MaterialPageRoute(
                builder: (context) => RichiestaSchedePage());
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
    firestoreInstance.collection("SchedaCorsa").add(
        {
          "BPM" : _BPMController.text,
          "KM" : _kmController,
          "Pendenza ": _pendenzaController.text,
          "Obiettivo" : _obiettivoController,

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
                        'CREA UNA NUOVA SCHEDA',
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
                      _buildKMTF(),
                      SizedBox(height: 10.0),
                      _buildPendenzaTF(),
                      SizedBox(height: 10.0,),
                      _buildObiettivoTF(),
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