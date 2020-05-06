// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mtag_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MtagEntity _$MtagEntityFromJson(Map<String, dynamic> json) {
  return MtagEntity(
    json['name'] as String,
    json['isTag'] as bool,
  );
}

Map<String, dynamic> _$MtagEntityToJson(MtagEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isTag': instance.isTag,
    };
