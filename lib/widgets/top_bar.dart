import 'package:flutter/material.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }


class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Nome Utente'),
          backgroundColor: Color(0xFFfc6a26),//Qui va inserito il nome del profilo che si è registrato dal database
          actions: <Widget>[
        IconButton(
        icon: const Icon(Icons.menu),
        onPressed: ()  {
          buildMenu();
          /*Route route = MaterialPageRoute(
              builder: (context) => ModificaProfiloView());
          Navigator.push(context, route); */
      },
    )
    ]
    ),
    );
  }

  Widget buildMenu()  {
    return Container(
        child: PopupMenuButton<WhyFarther>(
      onSelected: (WhyFarther result) { /*setState(() { var _selection = result; }); */},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.harder,
          child: Text('Working a lot harder'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.smarter,
          child: Text('Being a lot smarter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.selfStarter,
          child: Text('Being a self-starter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.tradingCharter,
          child: Text('Placed in charge of trading charter'),
        ),
      ],
    )
    );
  }
}