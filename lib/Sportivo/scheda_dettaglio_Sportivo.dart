import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/Sportivo/Sportivo_model.dart';

import 'HomePageMenuSP.dart';
import 'Lista_Schede_Sportivo.dart';
import 'Profilo_Public.dart';


class SchedaDettaglioSportivo extends StatefulWidget {
  final SportivoModel detail;
  Utente utente;


  SchedaDettaglioSportivo({Key key, @required this.detail, Utente utente}) : super(key: key);
  

  @override
  _VideoDetailState createState() => _VideoDetailState(utente:utente);
}

class _VideoDetailState extends State<SchedaDettaglioSportivo> {
  Utente utente;
  _VideoDetailState({Key key, this.utente});
  bool push=false;
  String follow="Segui";

  void changeworld(){
    if(follow=="Segui") {
      setState(() {
        follow = "Segui già";
      });
    }
    else{
      setState(() {
        follow="Segui";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> _layouts = [
      _videoInfo(),
      _channelInfo(),
      _moreInfo(),
      ListaSchedaSportivo(
        listData: sportivoData, utente: utente,
        isMiniList: true,
      ),
    ];

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      _layouts.clear();
    }


    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xFF01579B),
            size: 30,
          ),
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: () {
              Route route = MaterialPageRoute(
                  builder: (context) => homePageSP(utente: utente,) );
              Navigator.push(context, route); },
          ),
          title: Text("HelpYourWorkout",  style: TextStyle(fontSize: 14, color: Color(0xFFfc6a26))),
        ),
        body: Column(
          children: <Widget>[
            _buildVideoPlayer(context),
            Expanded(
              child: ListView(
                children: _layouts,
              ),
            )
          ],
        ));
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? 200.0
          : MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.detail.thumbNail), fit: BoxFit.cover)),
    );
  }

  Widget _videoInfo() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.detail.title),
          subtitle: Text(widget.detail.viewCount),
        ),
      ],
    );
  }

  Widget _buildButtonColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Icon(
            icon,
            color: Colors.grey[700],
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _channelInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
          onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PublicProfilePage(nome: widget.detail.channelTitle,utente:utente),
              ),//fare
              );
              },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(widget.detail.channelAvatar),
              ),
              title:  Text(
                widget.detail.channelTitle,
                overflow: TextOverflow.ellipsis,
              ),

              subtitle: Text("15.000 follower"),


            ),
            ),


          ),

          RaisedButton.icon(
              onPressed: () {
                  changeworld();
                },
              icon: Icon(
                Icons.people_rounded,
                color: Color(0xFFfc6a26),
              ),
              label: Text(
                "$follow",
                style: TextStyle(color: Color(0xFFfc6a26)),
              ))
        ],
      ),
    );
  }

  Widget _moreInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Expanded(child: Text("Altre schede...")),

        ],
      ),
    );
  }
}

