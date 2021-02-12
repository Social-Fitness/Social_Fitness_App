import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Schede.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/PersonalTrainer/Lista_Schede_PT.dart';
import 'package:social_fitness_app/Sportivo/Sportivo_model.dart';

import 'Lista_Schede_Sportivo.dart';


class HomeScreenSportivo extends StatelessWidget {
  Utente utente;
  HomeScreenSportivo({Utente utente});
  final _fireStore = FirebaseFirestore.instance;
  List<Schede> schede = [];
  String title;
  String thumbNail;
  String publishedTime;
  String channelTitle;
  String channelAvatar;
  String viewCount;
  String contenuto;

  void messagesStream() async {
    await for (var snapshot in _fireStore.collection("scheda").snapshots()) {
      for (var message in snapshot.docs) {
          title = message["title"];
          thumbNail = message["thumbNail"];
          publishedTime = message["publishedTime"];
          channelTitle = message["channelTitle"];
          channelAvatar = message["channelAvatar"];
          viewCount = message["viewCount"];
          contenuto = message["contenuto"];

          Schede s = new Schede(title,
              thumbNail,
              publishedTime,
              channelTitle,
              channelAvatar,
              viewCount,
              contenuto);
          schede.add(s);
        }
      }
    }



  @override
  Widget build(BuildContext context) {
    messagesStream();
    return ListaSchedaSportivo(schede: schede, utente: utente);
  }
}
