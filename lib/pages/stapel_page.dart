import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabu_geo/daten/karte.dart';
import 'package:tabu_geo/karte_widgets/karte_widget.dart';
import 'package:tabu_geo/repository/card_config_repo.dart';

import 'karte_page.dart';

class StapelPage extends StatefulWidget {
  List<Karte> karten;

  StapelPage(this.karten);

  @override
  _StapelPageState createState() => _StapelPageState();
}

class _StapelPageState extends State<StapelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          print(widget.karten.length);
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KartePage(widget.karten.first)));

          if (widget.karten.length == 1)
            Navigator.of(context).pop();
          else
            setState(() {
              widget.karten.removeAt(0);
            });

          print(widget.karten.length);
        },
        child: IgnorePointer(
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    bottom: constraints.maxHeight - 60,
                    child: Hero(
                        tag: "karte", child: KarteWidget(widget.karten.first)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
