
import 'package:json_annotation/json_annotation.dart';

import 'bild.dart';
part 'karte.g.dart';
@JsonSerializable(explicitToJson: false)
class Karte {
  late String begriff;
  late String? defenition;
  List<String>? verboten;

  Bild? bild;

  Karte({required this.begriff, this.defenition, this.verboten, this.bild});

  factory Karte.fromJson(Map<String, dynamic> json) => _$KarteFromJson(json);
}

