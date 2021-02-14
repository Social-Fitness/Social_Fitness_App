import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/Chat/login.dart';
import 'package:social_fitness_app/PersonalTrainer/HomePageMenuPT.dart';


class PublicProfileAcessPTPage extends StatefulWidget {
  String nome;
  String cognome;
  String email;
  Utente utente;
  PublicProfileAcessPTPage({Key key, this.utente,this.nome, this.cognome, this.email}): super(key:key);
  @override
  PublicProfileAcessPTPageState createState() => new PublicProfileAcessPTPageState(utente: utente,nome: nome, cognome:cognome, email:email);
}

class PublicProfileAcessPTPageState extends State<PublicProfileAcessPTPage> with SingleTickerProviderStateMixin {
  String nome;
  String cognome;
  String email;
  Utente utente;
  PublicProfileAcessPTPageState({Key key,this.utente, this.nome, this.cognome, this.email});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Profilo Sportivo', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w200),),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (context) => homePagePT(utente: utente));
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
                        color: Color(0xFFfc6a26),
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
                            Text('2',
                              style: TextStyle(fontSize: 14,
                                  color: Colors.black),),
                            SizedBox(height: 5,),
                            Text('Schede Salvate', style: TextStyle(fontSize: 14,
                                color: Colors.black.withOpacity(0.5)),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildChatBtn(),
                ],
              ),
            ),
            SizedBox(height: 5,),
            SizedBox(height: 20, child: Container(
              color: Color(0xFF01579B).withOpacity(0.2),
            ),),
            SizedBox(height: 10,),
      ],
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

}