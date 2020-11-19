import 'package:filter_list/filter_list.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:social_fitness_app/userProfile.dart';


class FilterPage extends StatefulWidget {
  @override
  FilterPageState createState() => FilterPageState();
  const FilterPage({Key key, this.allTextList}) : super(key: key);
  final List<String> allTextList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter list Page"),
      ),
      body: SafeArea(
        child: FilterListWidget(
          allTextList: allTextList,
          height: MediaQuery.of(context).size.height,
          hideheaderText: true,
          onApplyButtonClick: (list) {
            if(list != null){
              print("selected list length: ${list.length}");
            }
          },
        ),
      ),
    );
  }
}

class FilterPageState extends State<FilterPage> {

  List<String> countList = [
    "Corsa",
    "Ciclismo",
    "Alpinismo",
    "Arrampicata Sportiva",
    "Personal Trainer",
    "06:00 - 09:00",
    "09:00 - 12:00",
    "12:00 - 15:00",
    "15:00 - 18:00",
    "18:00 - 21:00",
    "21:00 - 00:00",
  ];
  List<String> selectedCountList = [];



  void _openFilterDialog() async {
    await FilterListDialog.display(
        context,
        allTextList: countList,
        height: 480,
        borderRadius: 20,
        headlineText: "Cerca l'attività",
        searchFieldHintText: "Cerca",
        selectedTextList: selectedCountList,
        onApplyButtonClick: (list) {
          if (list != null) {
            setState(() {
              selectedCountList = List.from(list);
            });
          }
          Navigator.pop(context);
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gestione Attività"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openFilterDialog,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        /// check for empty or null value selctedCountList
        body: selectedCountList == null || selectedCountList.length == 0
            ? Center(
          child: Text('Nessuna Attività Selezionata'),
        )
            : ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(selectedCountList[index]),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: selectedCountList.length));
  }



}