import 'dart:async';
import 'dart:math';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Mappa.dart';
class MapPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(0, 51, 102,3),

      body: Container(
            child: Container(
              color: Colors.grey,
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.only(top:15.0),
              child: SearchBar(
                minimumChars: 1,
                searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
                headerPadding: EdgeInsets.symmetric(horizontal: 10),
                listPadding: EdgeInsets.symmetric(horizontal: 10),

                //onSearch: _getALlPosts,
                //searchBarController: _searchBarController,

                cancellationWidget: Text("Cancel"),
                emptyWidget: Text("empty"),
                onCancelled: () {
                  print("Cancelled triggered");
                },
                mainAxisSpacing: 10,
              ),
            ),
            /*  child: Container(
               GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: posizione,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),*/
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
