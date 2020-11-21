import 'dart:async';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:social_fitness_app/pianifica_att_pt.dart';
import 'package:social_fitness_app/pianifica_att_utente.dart';
import 'package:social_fitness_app/userProfile.dart';

//la barra di sopra deve ricercare i luoghi all'interno della mappa



class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  int currentTab = 1;
  SearchBar searchBar;
  userProfile profilo;
  MapPage mappa;
  Widget currentPage;
  List<Widget> pages;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int selectedPage = 0;
  final _pageOptions = [MapPage(),  userProfile(), PianificaAttivitaUtScreen(), PianificaAttivitaPTScreen()];

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
        height: 550,
        borderRadius: 30,
        headlineText: "Attività",
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


  void _onItemTapped(int index) {
    setState(() {
      currentTab = index;
      currentPage = pages[index];
    });
  }

  @override
  void initState(){
    profilo = new userProfile();
    mappa = new MapPage();

    pages = [profilo,mappa];
    currentPage = mappa;
    super.initState();
  }


  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text("Cerca un luogo"),
        actions: [searchBar.getSearchAction(context)]
    );
  }

  MapPageState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar,
        //onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
        ],
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(bottom: 90.0),
        child: FittedBox(
            child:FloatingActionButton(
              onPressed: _openFilterDialog,
              tooltip: 'Increment',
              child: Icon(Icons.filter_list),
      ),
        ),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(40.774173, 14.766503), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }


  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}