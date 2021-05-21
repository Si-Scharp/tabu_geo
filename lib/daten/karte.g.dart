// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'karte.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Karte _$KarteFromJson(Map<String, dynamic> json) {
  return Karte(
    begriff: json['begriff'] as String,
    defenition: json['defenition'] as String?,
    verboten:
        (json['verboten'] as List<dynamic>?)?.map((e) => e as String).toList(),
    bild: json['bild'] == null
        ? null
        : Bild.fromJson(json['bild'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KarteToJson(Karte instance) => <String, dynamic>{
      'begriff': instance.begriff,
      'defenition': instance.defenition,
      'verboten': instance.verboten,
      'bild': instance.bild,
    };
