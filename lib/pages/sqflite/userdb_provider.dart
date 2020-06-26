import 'package:example/pages/sqflite/basedb_provider.dart';
import 'package:example/pages/sqflite/user_info_entity.dart';
import 'package:sqflite/sqflite.dart';

class UserDbProvider extends BaseDbProvider{

  ///表名
  final String name = 'UserInfo';

  //用户id
  final String columnId="id";
  //用户手机号
  final String columnMobile="mobile";
  //用户头像
  final String columnHeadImage="headImage";

  UserDbProvider();

  @override
  createTableString() {
    return  '''
        create table $name (
        $columnId integer primary key,$columnHeadImage text not null,
        $columnMobile text not null)
      ''';
  }

  @override
  tableName() {
    return name;
  }

  /// 查询数据
  Future _getUserProvider(Database db,int id) async{
    List<Map<String,dynamic>> maps = await db.rawQuery("select * from $name where $columnId = $id");
    return maps;
  }

  /// 插入数据
  Future insert(UserInfoEntity user) async{
    Database db = await getDataBase();
     var userProvider = _getUserProvider(db, user.id);
     //如果存在
     if(userProvider != null){
       //删除数据
       await db.delete(name,where: "$columnId = ?",whereArgs: [user.id]);
     }
     return await db.rawInsert("insert into $name ($columnId,$columnMobile,$columnHeadImage) values (?,?,?)",[user.id,user.mobile,user.headImage]);
  }

  /// 更新数据
  Future update(UserInfoEntity user) async{
    Database db = await getDataBase();
    await db.rawUpdate( "update $name set $columnMobile = ?,$columnHeadImage = ? where $columnId= ?",[user.mobile,user.headImage,user.id]);
  }

  /// 删除数据
  Future delete(int id) async{
    Database db = await getDataBase();
    return await db.delete(name,where: "$columnId = ?",whereArgs: [id]);
  }

  /// 获取数据
  Future<UserInfoEntity> getUser(int id) async{
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps = await _getUserProvider(db,id);
    if(maps != null && maps.length > 0){
      return UserInfoEntity().fromJson(maps[0]);
    }
    return null;
  }
}