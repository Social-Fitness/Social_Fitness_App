import  'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_fitness_app/HomePageMenu.dart';
import 'package:social_fitness_app/utils/constants.dart';

import 'Back-End/Crypt_Password.dart';
import 'Back-End/read_DataUsers.dart';

/*class InformazioniPersonali {
  String nome, cognome, data, cat, cap, city, email;
  InformazioniPersonali(this.nome, this.cognome, this.data, this.cat, this.cap, this.city, this.email);
}*/

class ModificaProfiloView extends StatefulWidget {
  //InformazioniPersonali ip;
  //ModificaProfiloView(this.ip);
  @override
  ModificaProfiloStateView createState() => ModificaProfiloStateView();
  //ModificaProfiloStateView createState() => ModificaProfiloStateView(ip.nome, ip.cognome, ip.data, ip.cat, ip.cap, ip.city, ip.email);
}

class ModificaProfiloStateView extends State<ModificaProfiloView> {
  bool isSwitched = false;
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController _nomeController = new TextEditingController();
  TextEditingController _cognomeController = new TextEditingController();
  String _dataNascitaController;
  TextEditingController _cittaController = new TextEditingController();
  TextEditingController _capController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confermapasswordController = new TextEditingController();
  bool _validateNome = false;
  bool _validateCognome = false;
  bool _validateCitta = false;
  bool _validateCap = false;
  bool _validateEmail = false;
  bool _validatePw = false;
  bool _validateConfermaPw = false;
  String _errorEmail = null;
  String _passwordError = null;

  String nome;
  String cognome;
  String data;
  String cat;
  String cap;
  String city;
  String email;

   //ModificaProfiloStateView (this.nome, this.cognome, this.data, this.cat, this.cap, this.city, this.email);


  Widget botton_switch() {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text(
          'Abilita Modifica',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
        width: 100,
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 50,
          child: Switch(
          value: isSwitched,
            onChanged: (value) {
            setState(() {
            isSwitched = value;
            print(isSwitched);
          });
        },
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      ),
    ),
    ]
    );
  }


  Widget _buildNomeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nome',
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
                Icons.person,
                color: Colors.white,
              ),
              hintText: nome,
              errorText: _validateNome ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCognomeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Cognome',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _cognomeController,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: cognome,
              errorText: _validateCognome
                  ? 'Il campo non può essere vuoto'
                  : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatadiNascitaTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Data Di Nascita',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              hintText: data,
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
              hintText: city,
              errorText: _validateCitta
                  ? 'Il campo non può essere vuoto'
                  : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCAPTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'CAP',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _capController,
            keyboardType: TextInputType.number,
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
              hintText: cap,
              errorText: _validateCap ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: email,
              errorText: _validateEmail
                  ? 'Il campo non può essere vuoto'
                  : _errorEmail,
              hintStyle: kHintTextStyle,
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
          'Password',
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
                color: Colors.white,
              ),
              hintText: 'Inserisci la tua Password',
              errorText: _validatePw ? 'Il campo non può essere vuoto' : null,
              hintStyle: kHintTextStyle,
              suffixIcon: SizedBox(
                width: 50.0,
                height: 50.0,
                child: new FlatButton(
                    onPressed: _toggle,
                    child: new Icon(_obscureText ? Icons.remove_red_eye : Icons
                        .remove_red_eye_outlined, color: Colors.white,)
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
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Conferma la tua Password',
              errorText: _validateConfermaPw
                  ? 'Il campo non può essere vuoto'
                  : _passwordError,
              hintStyle: kHintTextStyle,
              suffixIcon: SizedBox(
                width: 50.0,
                height: 50.0,
                child: new FlatButton(
                    onPressed: _toggleConferma,
                    child: new Icon(
                      _obscureConfermaText ? Icons.remove_red_eye : Icons
                          .remove_red_eye_outlined, color: Colors.white,)
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildRegistratiBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            int i = 0;
            if (_nomeController.text.isEmpty)
              _validateNome = true;
            else {
              _validateNome = false;
              i++;
            }


            if (_cognomeController.text.isEmpty)
              _validateCognome = true;
            else {
              _validateCognome = false;
              i++;
            }


            Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = new RegExp(pattern);

            if (_emailController.text.isEmpty)
              _validateEmail = true;
            else
              _validateEmail = false;
            if (regex.hasMatch(_emailController.text)) {
              i++;
              _errorEmail = null;
            }
            else
              _errorEmail = "Email non valida!";


            if (_passwordController.text.isEmpty)
              _validatePw = true;
            else {
              _validatePw = false;
              i++;
            }


            if (_confermapasswordController.text.isEmpty)
              _validateConfermaPw = true;
            else {
              _validateConfermaPw = false;
              if ((_confermapasswordController.text).compareTo(
                  _passwordController.text) == 0) {
                i++;
                _passwordError = null;
              }
              else
                _passwordError = "Le due password non corrispondono";
            }


            if (_cittaController.text.isEmpty)
              _validateCitta = true;
            else {
              _validateCitta = false;
              i++;
            }


            if (_capController.text.isEmpty)
              _validateCap = true;
            else {
              _validateCap = false;
              i++;
            }

            if (i == 7) {
              _insertToDb();
              Route route = MaterialPageRoute(
                  builder: (context) => homePage());
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
          'Modifica',
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

  _insertToDb() {
    var encrypted = encryptAESCryptoJS(_passwordController.text, "password");
    //var decrypted = decryptAESCryptoJS(encrypted, "password");
    firestoreInstance.collection("users").add(
        {
          "Categoria": "Sportivo",
          "Nome": _nomeController.text,
          "Cognome": _cognomeController.text,
          "Data_Di_Nascita ": _dataNascitaController,
          "Email": _emailController.text,
          "Password": encrypted,
          "Indirizzo": {
            "Città": _cittaController.text,
            "CAP": _capController.text,
          }
        }).then((value) {
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
                        'INFORMAZIONI PERSONALI',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      botton_switch(),
                      SizedBox(height: 20.0),
                      _buildNomeTF(),
                      SizedBox(height: 10.0),
                      _buildCognomeTF(),
                      SizedBox(height: 10.0),
                      _buildDatadiNascitaTF(),
                      SizedBox(height: 10.0,),
                      _buildCittaTF(),
                      SizedBox(height: 10.0),
                      _buildCAPTF(),
                      SizedBox(height: 10.0),
                      _buildEmailTF(),
                      SizedBox(height: 10.0),
                      _buildPasswordTF(),
                      SizedBox(height: 10.0),
                      _buildConfermaPasswordTF(),
                      _buildRegistratiBtn()
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
