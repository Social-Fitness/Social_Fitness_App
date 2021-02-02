import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/PersonalTrainer/Profilo_PublicPT.dart';


class SearchPT extends SearchDelegate {
  Utente utente;
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query="";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult;

  @override
  Widget buildResults(BuildContext context) {
    return Container(
        child:Center(
          child: Text(selectedResult),
        )
    );
  }

  final List<String> listExample;
  SearchPT(this.listExample,{this.utente});
  final List<String> recentList=[];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList=[];
    query.isEmpty
        ? suggestionList=recentList
        : suggestionList.addAll(listExample.where((element) => element.contains(query),));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          onTap: () {
            print("SELECTED" + suggestionList[index]);
            Route route = MaterialPageRoute(
                builder: (context) => PublicProfilePTPage(nome: suggestionList[index], utente:utente));
            Navigator.push(context, route);
          },
        );
      },
    );
  }


}