import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/DashBoardSportivo.dart';


class homePageSP extends StatefulWidget {
  @override
  homePageStateSP createState() => homePageStateSP();
}

class homePageStateSP extends State<homePageSP> {
  int _currentIndex = 0;
  final List<Widget> _children = [DashBoardSportivo(), DashBoardSportivo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HelpYouWorkout"),

        actions: [
          IconButton(icon:Icon(Icons.filter_alt),
          onPressed: _openFilterDialog,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
            IconButton(icon:Icon(Icons.search)),
          ),
          IconButton(icon:Icon(Icons.menu))
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF01579B),
          size: 30,
        ),
      ),

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        currentIndex: _currentIndex,
        backgroundColor: Colors.black12,
        selectedItemColor: Color(0xFFfc6a26),
        unselectedItemColor: Color(0xFF01579B),
        selectedFontSize: 15,
        unselectedFontSize: 15,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.arrow_upward),
            title: new Text("Torna su"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.people_alt),
            title: new Text("Seguiti"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.assignment),
            title: new Text("Schede preferite"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.add_alert),
            title: new Text("Notifiche"),
          ),
        ],
      ),
    );
  }


  List<String> countList = [
    "Corsa/Camminata",
    "Ciclismo",
    "Yoga/Pilates",
    "Corpo Libero",
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
        height: 500,
        borderRadius: 20,
        headlineText: "FILTRA GLI ALLENAMENTI",
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
}