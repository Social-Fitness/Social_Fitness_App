import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/Sportivo/Sportivo_model.dart';

import 'package:social_fitness_app/Sportivo/scheda_dettaglio_Sportivo.dart';

class ListaSchedaSportivo extends StatelessWidget {
  final List<SportivoModel> listData;
  final bool isMiniList;
  final bool isHorizontalList;
  Utente utente;

  ListaSchedaSportivo(
      {this.listData, this.isMiniList = false, this.isHorizontalList = false, Utente utente});

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
                builder: (context) => SchedaDettaglioSportivo(
                  detail: listData[index], utente:utente
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
                  builder: (context) => SchedaDettaglioSportivo(
                    detail: listData[index],
                      utente:utente
                  ),
                ));
              },
              child: _buildLandscapeList(context, index),
            );
          } else {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SchedaDettaglioSportivo(
                    detail: listData[index],
                      utente:utente
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

  Widget _buildPopupDialog1(BuildContext context) {
    return new AlertDialog(
      title: const Text('Filtraggio Schede'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("In questo momento le uniche schede disponibili sono quelle per gli allenamenti di corsa!"),
          Text("\n"),
          Text("Ciclismo - COMING SOON"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Chiudi'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog4(BuildContext context) {
    return new AlertDialog(
      title: const Text('Filtraggio Schede'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("In questo momento le uniche schede disponibili sono quelle per gli allenamenti di corsa!"),
          Text("\n"),
          Text("Ciclismo - COMING SOON"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Chiudi'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog3(BuildContext context) {
    return new AlertDialog(
      title: const Text('Filtraggio Schede'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("In questo momento le uniche schede disponibili sono quelle per gli allenamenti di corsa!"),
          Text("\n"),
          Text("Ciclismo - COMING SOON"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Chiudi'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog2(BuildContext context) {
    return new AlertDialog(
      title: const Text('Filtraggio Schede'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("In questo momento le uniche schede disponibili sono quelle per gli allenamenti di corsa!"),
          Text("\n"),
          Text("Ciclismo - COMING SOON"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Chiudi'),
        ),
      ],
    );
  }
  Widget _buildPopupDialog5(BuildContext context) {
    return new AlertDialog(
      title: const Text('Filtraggio Schede'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("In questo momento le uniche schede disponibili sono quelle per gli allenamenti di corsa!"),
          Text("\n"),
          Text("Ciclismo - COMING SOON"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Chiudi'),
        ),
      ],
    );
  }

  Widget _buildPortraitList(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(listData[index].thumbNail),
                fit: BoxFit.cover),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          dense: true,
          leading: CircleAvatar(
            backgroundImage: AssetImage(listData[index].channelAvatar),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(listData[index].title),
          ),
          subtitle: Text(
              "${listData[index].channelTitle} . ${listData[index].viewCount} . ${listData[index].publishedTime}"),
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
                  image: AssetImage(listData[index].thumbNail) ,
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
                    child: Text(listData[index].title) ,
                  ),
                  subtitle: !isMiniList
                      ? Text(
                      "${listData[index].channelTitle} . ${listData[index].viewCount} . ${listData[index].publishedTime}")
                      : Text(
                      "${listData[index].channelTitle} . ${listData[index].viewCount}"),
                  trailing: Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: Icon(Icons.more_vert)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: !isMiniList
                      ? CircleAvatar(
                    backgroundImage:
                    AssetImage(listData[index].channelAvatar),
                  )
                      : SizedBox(),
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
                image: AssetImage(listData[index].thumbNail),
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
                        listData[index].title,
                        style: TextStyle(fontSize: 12.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      listData[index].channelTitle,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[600],
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
