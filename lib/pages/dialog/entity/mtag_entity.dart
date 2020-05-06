import 'package:json_annotation/json_annotation.dart';

part 'mtag_entity.g.dart';


@JsonSerializable()
class MtagEntity extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'isTag')
  bool isTag;

  MtagEntity(this.name,this.isTag,);

  factory MtagEntity.fromJson(Map<String, dynamic> srcJson) => _$MtagEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MtagEntityToJson(this);

}


