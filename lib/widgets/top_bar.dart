import 'package:flutter/material.dart';
import 'package:social_fitness_app/Back-End/read_DataUsers.dart';
import 'package:social_fitness_app/modifica_Profilo.dart';

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
        onPressed: () async {

          /*Future _getInfo(String emai)  async {
            var x = Read_Data_Services();
            var docs = await x.getDataUsers(emai);
            var nome = docs.documents[0].get("Nome");
            var cognome = docs.documents[0].get("Cognome");
            var data = docs.documents[0].get("Data_Di_Nascita");
            var cat = docs.documents[0].get("Categoria");
            var cap = docs.documents[0].get("CAP");
            var city = docs.documents[0].get("Città");
            var email = docs.documents[0].get("Email");
            return InformazioniPersonali(nome, cognome, data, cat, cap, city, email);
          }

          InformazioniPersonali ip = await _getInfo("salvatore.amideo97@gmail.com");*/
          Route route = MaterialPageRoute(
              builder: (context) => ModificaProfiloView());
          Navigator.push(context, route);
      },
    )
    ]
    ),
    );
  }
}