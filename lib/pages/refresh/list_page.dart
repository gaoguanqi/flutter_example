import 'package:dio/dio.dart';
import 'package:example/common/config/config.dart';
import 'package:example/common/utils/utils.dart';
import 'package:example/common/widgets/widgets.dart';
import 'package:example/pages/refresh/entity/mv163_entity.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final String _limit = '10'; //取出数量 , 默认为 30
  int _offset = 1; //偏移数量 , 用于分页 , 如 :( 页数 -1)*50, 其中 50 为 limit 的值 , 默认 为 0
  bool _isMore = true;
  List<Data> _data;


  @override
  void initState() {
    super.initState();
    getDate(_limit,_offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: _data == null ? _bulidEmpty() :ListView.builder(
        itemBuilder: _buildItem,
        itemCount: _data.length,
        scrollDirection: Axis.vertical,
        itemExtent: duSetHeight(120),
      ),
    );
  }

  Widget _bulidEmpty(){
    return Container(
      alignment: Alignment.center,
      child: Text('正在加载中...'),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return GestureDetector(
      onTap: (){
        toastInfo(msg: '点击了$index');
      },
      child: Container(
          child: Row(
            children: <Widget>[
              Expanded(child: Image.network(_data[index].cover,fit: BoxFit.cover,height: duSetHeight(118),),flex: 6,),
              Expanded(child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_data[index].name,style: TextStyle(
                      color: Colors.black87,
                      fontSize: duSetFontSize(16),
                      fontWeight: FontWeight.w600,
                    ),maxLines: 2,overflow: TextOverflow.ellipsis,),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(child: Text(_data[index].artistName,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: duSetFontSize(14),
                            fontWeight: FontWeight.w400,
                          ),maxLines: 1,overflow: TextOverflow.ellipsis,),flex: 1,),
                        IconButton(icon: Icon(Icons.star),onPressed: (){
                          toastInfo(msg: _data[index].artistName);
                        }),
                      ],
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 8,top: 8,right: 6,bottom: 0),
              ),flex: 7,),
            ],
          ),
          // 下边框
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))
          )
      ),
    );
  }









  void getDate(String limit,int offset) async{
    final String path = BASE_URL+'/mv/exclusive/rcmd?limit=$limit&offset=$offset';
    try{
      final Response res = await Dio().get(path);
      final Mv163Entity entity = Mv163Entity.fromJson(res.data);
      if(entity != null){
        if(entity.code == 200){
          if(_data == null){
            setState(() {
              _data = entity.data;
              _isMore = entity.more;
            });
          }else{
            setState(() {
              _data.addAll(entity.data);
              _isMore = entity.more;
            });
          }
        }
      }
    }catch(e){
      toastInfo(msg: 'http error');
    }
  }
}
