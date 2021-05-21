import 'package:json_annotation/json_annotation.dart';

part 'bild.g.dart';

@JsonSerializable(explicitToJson: false)
class Bild {
  String url;
  String? quelle;

  Bild({required this.url, this.quelle});

  factory Bild.fromJson(Map<String, dynamic> json) => _$BildFromJson(json);

}
