import 'package:json_annotation/json_annotation.dart';

part 'mv163_entity.g.dart';


@JsonSerializable()
class Mv163Entity extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'more')
  bool more;

  @JsonKey(name: 'code')
  int code;

  Mv163Entity(this.data,this.more,this.code,);

  factory Mv163Entity.fromJson(Map<String, dynamic> srcJson) => _$Mv163EntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Mv163EntityToJson(this);

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

  Data(this.id,this.cover,this.name,this.playCount,this.artistName,this.artistId,this.duration,this.mark,this.subed,this.artists,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Artists extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  Artists(this.id,this.name,);

  factory Artists.fromJson(Map<String, dynamic> srcJson) => _$ArtistsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);

}


