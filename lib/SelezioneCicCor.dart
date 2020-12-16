import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_fitness_app/Registrazione_Page_PT.dart';
import 'package:social_fitness_app/Registrazione_Page_Sportivo.dart';
import 'package:social_fitness_app/Allenamento_Ciclismo.dart';
import 'package:social_fitness_app/Allenamento_Corsa.dart';

class SelezioneSportScreen extends StatefulWidget {
  @override
  SelezioneSportScreenState createState() => SelezioneSportScreenState();
}

class SelezioneSportScreenState extends State<SelezioneSportScreen> {


  Widget _buildCorsaBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Route route = MaterialPageRoute(
              builder: (context) =>AllenamentoCorScreen());
          Navigator.push(context, route);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.white,
        child: Text(
          'CORSA/CAMMINATA',
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

  Widget _buildCiclismoBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Route route = MaterialPageRoute(
              builder: (context) =>AllenamentoCicScreen());
          Navigator.push(context, route);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
         Text(
          'CICLISMO',
          style: TextStyle(
            color: Color(0xFFfc6a26),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        ]
      ),
      ),
    );
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
           Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SELEZIONA UNO SPORT',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(height: 30.0),
                Image(
                  image: AssetImage(
                    'assets/image/running.png',
                  ),
                  height: 150.0,
                  width: 150.0,
                ),
                _buildCorsaBtn(),
                SizedBox(height: 30.0),
                Image(
                  image: AssetImage(
                    'assets/image/bike.png',
                  ),
                  height: 200.0,
                  width: 200.0,
                ),
                _buildCiclismoBtn()

          ]
        ),
    ]
    ),
    )
      )
    );
  }
}