import 'package:flutter/material.dart';
import 'package:social_fitness_app/models/PersonalTrainer_model.dart';
import 'package:social_fitness_app/screens/scheda_dettaglio_PT.dart';

class ListaSchedaPt extends StatelessWidget {
  final List<PersonalTrainerModel> listData;
  final bool isMiniList;
  final bool isHorizontalList;

  const ListaSchedaPt(
      {this.listData, this.isMiniList = false, this.isHorizontalList = false});

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    if (isHorizontalList) {
      return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SchedaDettaglioPT(
                  detail: listData[index],
                ),
              ));
            },
            child: _buildHorizontalList(context, index),
          );
        },
      );
    } else {
      return ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          if (isMiniList || deviceOrientation == Orientation.landscape) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SchedaDettaglioPT(
                        detail: listData[index],
                      ),
                ));
              },
              child: _buildLandscapeList(context, index),
            );
          } else {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SchedaDettaglioPT(
                        detail: listData[index],
                      ),
                ));
              },
              child: _buildPortraitList(context, index),
            );
          }
        },
        separatorBuilder: (context, index) => Divider(
              height: 1.0,
              color: Colors.grey,
            ),
        itemCount: listData.length,
      );
    }
  }

  Widget _buildPortraitList(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(listData[index].foto),
                fit: BoxFit.cover),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          dense: true,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(listData[index].titolo, style: new TextStyle(
              fontSize: 20,
            ), ),
          ),
          subtitle: Text(
              " ${listData[index].salva}"  ),
          trailing: Wrap(
            spacing:100, // space between two icons
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 5, top: 27, right: 33),
                child: Icon(Icons.favorite, size: 16,),
              ), // icon-1
              Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: RaisedButton(
                onPressed: () {
                  print("Button modifica premuto");
                },
                color: Color(0xFFfc6a26),
                child: Text(
                  "MODIFICA",
                  style: TextStyle(fontSize: 10),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFFfc6a26), width: 3),
                    borderRadius: BorderRadius.circular(5)),
              )
        ),
          ],
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeList(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Container(
//          width: MediaQuery.of(context).size.width / 2,
            width: isMiniList
                ? MediaQuery.of(context).size.width / 2
                : 336.0 / 1.5,
            height: isMiniList ? 100.0 : 188.0 / 1.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(listData[index].foto) ,
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  dense: isMiniList ? true : false,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(listData[index].titolo) ,
                  ),
                  subtitle: !isMiniList
                      ? Text(
                          "${listData[index].salva}")
                      : Text(
                          " ${listData[index].salva}"),
                  trailing: Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: Icon(Icons.more_vert)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalList(BuildContext context, int index) {
    return Container(
      width: 336.0 / 2.2,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 4.0),
            width: 336.0 / 2.2,
            height: 188 / 2.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(listData[index].foto),
              ),
            ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        listData[index].titolo,
                        style: TextStyle(fontSize: 12.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
