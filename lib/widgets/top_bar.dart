import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Nome Utente'), //Qui va inserito il nome del profilo che si è registrato dal database
          actions: <Widget>[
        IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
      },
    )
    ]
    ),
    );
  }
}