import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:tabu_geo/karte_widgets/karte_rueckseite.dart';
import 'package:tabu_geo/karte_widgets/karte_vorderseite.dart';

import '../daten/karte.dart';

class KarteWidget extends StatefulWidget {
  VoidCallback? onTurn;
  Karte karte;
  bool showSecondIcon;
  KarteWidget(this.karte, {this.onTurn, this.showSecondIcon = false});

  @override
  _KarteWidgetState createState() => _KarteWidgetState();
}

class _KarteWidgetState extends State<KarteWidget> {
  late FlipCardController _controller;

  @override
  void initState() {
    _controller = new FlipCardController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 380, maxHeight: 600),
      child: SizedBox.expand(
        child: FlipCard(
          controller: _controller,
          flipOnTouch: false,
            front: Card(
              color: Colors.green[800],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: KarteRueckseite(
                onTap: () {
                  if (widget.onTurn != null) widget.onTurn!();
                  _controller.toggleCard();
                },
                showSecondIcon: widget.showSecondIcon,
              ),
            ),
            back: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                child: KarteVorderseite(widget.karte))),
      ),
    );
  }
}
