// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bild.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bild _$BildFromJson(Map<String, dynamic> json) {
  return Bild(
    url: json['url'] as String,
    quelle: json['quelle'] as String?,
  );
}

Map<String, dynamic> _$BildToJson(Bild instance) => <String, dynamic>{
      'url': instance.url,
      'quelle': instance.quelle,
    };
