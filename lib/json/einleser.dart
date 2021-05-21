import 'dart:convert';
import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabu_geo/daten/karte.dart';

class Einleser {
  static Future<List<Karte>> einlesen(BuildContext context) async {
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap =
        json.decode(Uri.decodeFull(manifestContent));

    List<String> paths = new List<String>.empty(growable: true);
    for (int i = 0; i < manifestMap.length; i++) {
      paths.add(manifestMap.keys.toList()[i].toString());
    }

    paths = paths.where((element) => element.contains("/karten")).toList();


    List<Karte> karten = new List<Karte>.empty(growable: true);
    for (int i = 0; i < paths.length; i++) {
      var s = jsonDecode(await rootBundle.loadString(paths[i]));
      var k = Karte.fromJson(jsonDecode(await rootBundle.loadString(paths[i])));
      karten.add(k);
    }

    //List<String> paths = manifestMap.values.where((String element) => element.contains("json/")).toList();
    return karten;
  }
}
