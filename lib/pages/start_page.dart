import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabu_geo/json/einleser.dart';
import 'package:tabu_geo/daten/karte.dart';
import 'package:tabu_geo/pages/stapel_page.dart';
import 'package:tabu_geo/repository/card_config_repo.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late List<Karte> karten;
  bool ready = false;

  Future<bool> einlesen() async {
    var k = await Einleser.einlesen(context);
    if (k.isEmpty) return false;
    karten = k;
    setState(() {
      ready = true;

    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: FutureBuilder(
          future: einlesen(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData == false) return CircularProgressIndicator(color: Colors.white,);
            if (snapshot.hasError || snapshot.data! == false)
              return Icon(Icons.error);
            else
              return Icon(Icons.play_arrow);
          },
        ),
        onPressed: !ready
            ? null
            : () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StapelPage(karten..shuffle()))),
      ),
      appBar: AppBar(
        title: Text("GeoTabu"),
      ),
      body: ListView(
        children: [
          CheckboxListTile(
              title: Text("Zeige Beschreibung"),
              value: context.read<CardConfigRepo>().showDesc,
              onChanged: (x) {
                setState(() {
                  context.read<CardConfigRepo>().showDesc = x ?? true;
                });
              })
        ],
      ),
    );
  }
}

void _einlesen(context) {

}