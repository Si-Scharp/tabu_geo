import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tabu_geo/repository/card_config_repo.dart';import '../daten/karte.dart';

class KarteVorderseite extends StatelessWidget {
  Karte karte;
  KarteVorderseite(this.karte);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositoryProvider.of<CardConfigRepo>(context),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: _erstelle(karte, context)
        ),
      ),
    );
  }
}

List<Widget> _erstelle(Karte karte, BuildContext context) {
  List<Widget> l = List.empty(growable: true);

  //Begriff
  l.add(Text(karte.begriff, style: Theme.of(context).textTheme.subtitle1,),);

  l.add(SizedBox(height: 10,));

  if (karte.defenition != null && karte.defenition!.isNotEmpty && context.read<CardConfigRepo>().showDesc)
    l.add(Text(karte.defenition!, style: Theme.of(context).textTheme.subtitle2),);

  l.add(SizedBox(height: 8,));

  if (karte.verboten != null && karte.verboten!.isNotEmpty)
    l.add(
        Column(children: List.generate(karte.verboten!.length, (index) =>
            Text(
              karte.verboten![index],
              style: Theme.of(context).textTheme.subtitle2!.apply(color: Colors.red),)),
        )
    );

  if (karte.bild?.url != null && karte.bild!.url.isNotEmpty)
    l.add(ExtendedImage.network(karte.bild!.url, cache: true,));
  return l;
}