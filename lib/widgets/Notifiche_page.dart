import 'package:flutter/material.dart';

class NotifichePage extends StatefulWidget {
  @override
  NotifichePageState createState() => NotifichePageState();
}

class NotifichePageState extends State<NotifichePage> {
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
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                margin: EdgeInsets.only(top:10.0,bottom: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/image/pt1.jpg"),
                      backgroundColor: Colors.transparent,
                    ),
                    new Text("PT${index+1} Ha aggiunto una nuova scheda"), //Far uscire nome Pt al posto di PT+numero
                    new Image.asset("assets/image/Scheda1.jpg",height: 50.0,),
                  ],
                ));
          }),
    );
  }
}