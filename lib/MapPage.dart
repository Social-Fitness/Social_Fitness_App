import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:social_fitness_app/userProfile.dart';

//la barra di sopra deve ricercare i luoghi all'interno della mappa



class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  int currentTab = 1;
  int _selectedIndex=1;
  SearchBar searchBar;
  userProfile profilo;
  MapPage mappa;
  Widget currentPage;
  List<Widget> pages;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


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
        key: _scaffoldKey,
        /*appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("Fisciano"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),*/
      body: Stack(

        children: <Widget>[
          _buildGoogleMap(context),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profilo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: 'Pianifica attività',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0288D1),
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