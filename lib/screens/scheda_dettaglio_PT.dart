import 'package:flutter/material.dart';
import 'package:social_fitness_app/models/PersonalTrainer_model.dart';

import '../Lista_Schede_PT.dart';

class SchedaDettaglioPT extends StatefulWidget {
  final PersonalTrainerModel detail;

  const SchedaDettaglioPT({Key key, @required this.detail}) : super(key: key);

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<SchedaDettaglioPT> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _layouts = [
      _videoInfo(),
      _channelInfo(),
      _moreInfo(),
      ListaSchedaPt(
        listData: personalTrainerData,
        isMiniList: true,
      ),
    ];

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      _layouts.clear();
    }

    return Scaffold(
        body: Column(
          children: <Widget>[
            _buildVideoPlayer(context),
            Expanded(
              child: ListView(
                children: _layouts,
              ),
            )
          ],
        ));
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? 200.0
          : MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.detail.foto), fit: BoxFit.cover)),
    );
  }

  Widget _videoInfo() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.detail.titolo),
          subtitle: Text(widget.detail.salva),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildButtonColumn(Icons.share, "Condividi"),
              _buildButtonColumn(Icons.cloud_download, "Download"),

            ],
          ),
        )
      ],
    );
  }

  Widget _buildButtonColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Icon(
            icon,
            color: Colors.grey[700],
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _channelInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),

    );
  }

  Widget _moreInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Expanded(child: Text("Altre schede...")),

        ],
      ),
    );
  }
}
