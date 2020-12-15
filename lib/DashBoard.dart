import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/widgets/WorkoutCard.dart';


class DashBoard extends StatefulWidget {
  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  //here i'm going to place a list of image url
  List<String> imgUrl = [
    "assets/image/Scheda1.jpg",
    "assets/image/Scheda2.jpg",
    "assets/image/Scheda3.jpg",
    "assets/image/Scheda4.jpg",
    "assets/image/Scheda5.png",
    "assets/image/Scheda1.jpg",
  ];

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      //let's start by the appbar
      appBar: AppBar(
        backgroundColor: Color(0xFFfcfcfc),
        title: Text(
          "Help Your Workout",
          style: TextStyle(
            color: Color(0xFFfc6a26),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_alt,
              color: Colors.black,
            ),
            onPressed: _openFilterDialog,
          )
        ],
      ),

      //Now let's build the body of our app
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Let's create the welcoming Text
            Text(
              "Let's Workout! \nCerca il tuo allenamento",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x55d2d2d2),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Cerca... ",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 20.0),
                        ),
                      )),
                  RaisedButton(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    color: Color(0xFF01579B),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Now let's build the food menu
            //I'm going to create a custom widget
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                //let's change the aspect ration for the child card
                childAspectRatio: 0.7,
                children: [
                  foodCard(imgUrl[0], "WORKOUT 1", "BASE"),
                  foodCard(imgUrl[1], "WORKOUT 2", "INTERMEDIA"),
                  foodCard(imgUrl[2], "WORKOUT 3", "AVANZATA"),
                  foodCard(imgUrl[3], "WORKOUT 4", "BASE"),
                  foodCard(imgUrl[4], "WORKOUT 5", "BASE"),
                  foodCard(imgUrl[5], "WORKOUT 6", "INTERMEDIA"),
                ],
              ),
            )
          ],
        ),
      ),
      );
  }
}

