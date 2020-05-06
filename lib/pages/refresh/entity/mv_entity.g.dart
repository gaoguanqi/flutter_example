// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mv_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MvEntity _$MvEntityFromJson(Map<String, dynamic> json) {
  return MvEntity(
    json['count'] as int,
    json['hasMore'] as bool,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['code'] as int,
  );
}

Map<String, dynamic> _$MvEntityToJson(MvEntity instance) => <String, dynamic>{
      'count': instance.count,
      'hasMore': instance.hasMore,
      'data': instance.data,
      'code': instance.code,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as int,
    json['cover'] as String,
    json['name'] as String,
    json['playCount'] as int,
    json['briefDesc'] as String,
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
      'briefDesc': instance.briefDesc,
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
    (json['alias'] as List)?.map((e) => e as String)?.toList(),
    (json['transNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alias': instance.alias,
      'transNames': instance.transNames,
    };
