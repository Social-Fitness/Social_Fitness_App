import 'dart:async';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'MapPage.dart';
class Mappa extends StatefulWidget {

  @override
  State<Mappa> createState() => MappaState();
}

class MappaState extends State<Mappa> {

  Completer<GoogleMapController> _controller = Completer();
  static final LatLng posizioneLatLng = LatLng(40.665736, 14.788660);
  static final CameraPosition posizione = CameraPosition(
    target: LatLng(40.665736, 14.788660),
    zoom: 10,
  );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color.fromRGBO(0, 51, 102,3),

        body: Container(

          child: Container(
            alignment: Alignment.center,
            color: Colors.grey,
            margin: EdgeInsets.only(top: 200.0),

            height: 600,
            width: 500,
            child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: posizione,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
        ),




        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: 'Profilo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch),
              label: 'Pianifica attività',
            ),
          ],
        )


    );
  }

}
