// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mv163_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mv163Entity _$Mv163EntityFromJson(Map<String, dynamic> json) {
  return Mv163Entity(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['more'] as bool,
    json['code'] as int,
  );
}

Map<String, dynamic> _$Mv163EntityToJson(Mv163Entity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'more': instance.more,
      'code': instance.code,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as int,
    json['cover'] as String,
    json['name'] as String,
    json['playCount'] as int,
    json['artistName'] as String,
    json['artistId'] as int,
    json['duration'] as int,
    json['mark'] as int,
    json['subed'] as bool,
    (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'name': instance.name,
      'playCount': instance.playCount,
      'artistName': instance.artistName,
      'artistId': instance.artistId,
      'duration': instance.duration,
      'mark': instance.mark,
      'subed': instance.subed,
      'artists': instance.artists,
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) {
  return Artists(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
