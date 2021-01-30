import 'package:flutter/material.dart';

class FollowingPage extends StatefulWidget {
  @override
  FollowingPageState createState() => FollowingPageState();
}

class FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return new Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      child: new ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/image/pt2.jpg"),
                      backgroundColor: Colors.transparent,
                    ),
                    new Text("Personal Trainer ${index + 1} "), //Inserire nome personal trainer
                    new OutlineButton(
                      onPressed: () {},
                      child: new Text("Segui Già"),
                    ),
                  ],
                ));
          }),
    );
  }
}