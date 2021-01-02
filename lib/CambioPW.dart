import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_fitness_app/HomePageMenuPT.dart';
import 'package:social_fitness_app/utils/constants.dart';



class CambioPW extends StatefulWidget {
  @override
  CambioPWState createState() => CambioPWState();
}

class CambioPWState extends State<CambioPW> {
  final formKey= new GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController _pwattualeController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confermapasswordController = new TextEditingController();
  bool _validatePWattuale = false;
  bool _validatePw = false;
  bool _validateConfermaPw = false;
  String _passwordError=null;


  Widget _buildPWattualeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password attuale',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _pwattualeController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFFfc6a26),
              ),
              hintText: 'Inserisci la tua Password attuale',
              hintStyle: kHintTextStyle,
              errorText: _validatePWattuale ? 'Il campo non può essere vuoto' : null,
            ),
          ),
        ),
      ],
    );
  }
  bool _obscureText = true;
  bool _obscureConfermaText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void _toggleConferma() {
    setState(() {
      _obscureConfermaText = !_obscureConfermaText;
    });
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nuova Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _passwordController,
            obscureText: _obscureText,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFFfc6a26),
              ),
              hintText: 'Inserisci la nuova Password',
              hintStyle: kHintTextStyle,
              errorText: _validatePw ? 'Il campo non può essere vuoto' : null,
              suffixIcon: SizedBox(
                width: 50.0,
                height: 50.0,
                child: new FlatButton(
                    onPressed: _toggle,
                    child: new Icon(_obscureText ? Icons.remove_red_eye:Icons.remove_red_eye_outlined,color: Colors.white,)
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfermaPasswordTF() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Conferma Password',
            style: kLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              controller: _confermapasswordController,
              obscureText: _obscureConfermaText,
              style: TextStyle(
                color: Color(0xFFfc6a26),
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFFfc6a26),
                ),
                hintText: 'Conferma la tua Password',
                hintStyle: kHintTextStyle,
                errorText: _validateConfermaPw ? 'Il campo non può essere vuoto' : _passwordError,
                suffixIcon: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: new FlatButton(
                      onPressed: _toggleConferma,
                      child: new Icon(_obscureConfermaText ? Icons.remove_red_eye:Icons.remove_red_eye_outlined,color: Colors.white,)
                  ),
                ),
              ),
            ),
          ),
        ]
    );
  }

  Widget _buildIndietroTF() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.arrow_back),
            color: Color(0xFFfc6a26),
            onPressed: () {
              Route route = MaterialPageRoute(
                  builder: (context) => homePagePT() );
              Navigator.push(context, route); },
          ),

            ]
      );

  }



  Widget _buildCambiaPWBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            int i=0;

            if (_pwattualeController.text.isEmpty)
              _validatePWattuale = true;
            else
              _validatePWattuale=false;
              i++;


            if(_passwordController.text.isEmpty)
              _validatePw=true;
            else {
              _validatePw = false;
              i++;
            }



            if(_confermapasswordController.text.isEmpty)
              _validateConfermaPw=true;
            else {
              _validateConfermaPw=false;
              if((_confermapasswordController.text).compareTo(_passwordController.text)==0) {
                i++;
                _passwordError = null;
              }
              else
                _passwordError="Le due password non corrispondono";

            }

            if(i==3) {
             //fare update nel database
              Route route = MaterialPageRoute(
                  builder: (context) => homePagePT());
              Navigator.push(context, route);
            }

          });

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Cambia Password',
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

  /*_updateToDB() {
    var encrypted=encryptAESCryptoJS(_passwordController.text, "password");

    firestoreInstance.collection("users").add(
        {
          "Categoria": "Personal Trainer",
          "Nome": _nomeController.text,
          "Cognome": _cognomeController.text,
          "Data_Di_Nascita ": _dataNascitaController,
          "Email": _emailController.text,
          "Password": encrypted,
          "Cellulare": _cellController.text,
        }).then((value){
      print(value.id);
    });
  }*/

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
                        'CAMBIA LA TUA PASSWORD',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      _buildPWattualeTF(),
                      SizedBox(height: 10.0),
                      _buildPasswordTF(),
                      SizedBox(height: 10.0),
                      _buildConfermaPasswordTF(),
                      _buildCambiaPWBtn(),
                      _buildIndietroTF()
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