import 'package:flutter/material.dart';
import 'file:///C:/Users/Alice%20Vidoni/Desktop/Social_Fitness_App/lib/Sportivo/Profilo_Public.dart';
import 'package:social_fitness_app/Bean/Utente.dart';

class Search extends SearchDelegate {
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
  Search(this.listExample,{this.utente});
  final List<String> recentList=["Text1", "Text2", "Text3"];

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
                builder: (context) => PublicProfilePage(nome: suggestionList[index], utente:utente));
            Navigator.push(context, route);
          },
        );
      },
    );
  }


}