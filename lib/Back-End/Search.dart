import 'package:flutter/material.dart';

class Search extends SearchDelegate {

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
  Search(this.listExample);
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
            selectedResult=suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }


}