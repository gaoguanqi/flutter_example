import 'package:json_annotation/json_annotation.dart';

part 'mv_entity.g.dart';


@JsonSerializable()
class MvEntity extends Object {

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'hasMore')
  bool hasMore;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'code')
  int code;

  MvEntity(this.count,this.hasMore,this.data,this.code,);

  factory MvEntity.fromJson(Map<String, dynamic> srcJson) => _$MvEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MvEntityToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'briefDesc')
  String briefDesc;

  @JsonKey(name: 'artistName')
  String artistName;

  @JsonKey(name: 'artistId')
  int artistId;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'mark')
  int mark;

  @JsonKey(name: 'subed')
  bool subed;

  @JsonKey(name: 'artists')
  List<Artists> artists;

  Data(this.id,this.cover,this.name,this.playCount,this.briefDesc,this.artistName,this.artistId,this.duration,this.mark,this.subed,this.artists,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Artists extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'alias')
  List<String> alias;

  @JsonKey(name: 'transNames')
  List<String> transNames;

  Artists(this.id,this.name,this.alias,this.transNames,);

  factory Artists.fromJson(Map<String, dynamic> srcJson) => _$ArtistsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);

}


