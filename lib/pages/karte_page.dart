import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tabu_geo/karte_widgets/karte_widget.dart';
import 'package:tabu_geo/wegwerfbar.dart';

import '../daten/karte.dart';

class KartePage extends StatefulWidget {
  Karte karte;
  KartePage(this.karte);

  @override
  _KartePageState createState() => _KartePageState();
}

class _KartePageState extends State<KartePage> {
  bool isFlipped = false;
  bool breakTag = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        breakTag = true;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Wegwerfbar(
              onThrowAway: () {
                Navigator.of(context).pop();
              },
              throwEnabled: isFlipped,
              child: Hero(
                  tag: !breakTag ? "karte" : "dis",
                  child: KarteWidget(
                    widget.karte,
                    showSecondIcon: true,
                    onTurn: () {
                      setState(() {
                        isFlipped = true;
                      });
                    },
                  ))),
        ),
      ),
    );
  }
}
