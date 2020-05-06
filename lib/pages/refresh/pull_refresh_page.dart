import 'package:dio/dio.dart';
import 'package:example/common/config/config.dart';
import 'package:example/common/utils/screen.dart';
import 'package:example/common/widgets/toast.dart';
import 'package:example/pages/refresh/entity/mv163_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PullRefreshPage extends StatefulWidget {

  @override
  _PullRefreshPageState createState() => _PullRefreshPageState();
}

class _PullRefreshPageState extends State<PullRefreshPage> {

  final String _limit = '10'; //取出数量 , 默认为 30
  int _offset = 1; //偏移数量 , 用于分页 , 如 :( 页数 -1)*50, 其中 50 为 limit 的值 , 默认 为 0
  bool _isMore = true;
  List<Data> _data;

  EasyRefreshController _controller;


  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();

    getDate(_limit,_offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: (_data == null || _data.length == 0) ? _buildEmpty(): EasyRefresh.custom(
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        controller: _controller,
        header: _buildHeader(),
        footer: _buildFooter(),
        onRefresh: _handleRefresh,
        onLoad: _handleLoad,
        emptyWidget: (_data == null || _data.length == 0)? _buildEmpty() : null ,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                child: Container(
                  height: duSetHeight(120),
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
                  color: Colors.white,
                ),
                onTap: (){
                  toastInfo(msg: '点击了:$index');
                },
              );
            },
              childCount: _data.length,
            ),
          ),
        ],
      ),
    );
  }




   Widget _buildEmpty(){
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text('正在加载中...'),
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

  Header _buildHeader(){
    return ClassicalHeader(
        enableHapticFeedback: false,
        refreshText: '提示刷新',
        refreshReadyText: '准备刷新',
        refreshingText: '正在刷新',
        refreshedText: '刷新完成',
        refreshFailedText: '刷新失败',

    );
  }

  Footer _buildFooter() {
    return ClassicalFooter(
        enableHapticFeedback: false,
        noMoreText: '没有更多',
        loadingText: '正在加载',
    );
  }

  Future<void> _handleRefresh() async{
    await Future.delayed(Duration(seconds: 1), () async {
      if (mounted) {
        _offset = 1;
        final String path = BASE_URL+'/mv/exclusive/rcmd?limit=$_limit&offset=$_offset';
        try{
          final Response res = await Dio().get(path);
          final Mv163Entity entity = Mv163Entity.fromJson(res.data);
          if(entity != null){
            if(entity.code == 200){
              _data = entity.data;
              _isMore = entity.more;
            }
          }
        }catch(e){
          toastInfo(msg: '刷新失败');
        }

        setState(() {
          _controller.finishRefresh(success: _data != null,noMore: !_isMore);
          _controller.resetRefreshState();
          _controller.resetLoadState();
        });
      }
    });
  }

  Future<void> _handleLoad() async{
    await Future.delayed(Duration(seconds: 1), () async {
      if (mounted) {
        _offset += 1;
        final String path = BASE_URL+'/mv/exclusive/rcmd?limit=$_limit&offset=$_offset';
        try{
          final Response res = await Dio().get(path);
          final Mv163Entity entity = Mv163Entity.fromJson(res.data);
          if(entity != null){
            if(entity.code == 200){
              _data.addAll(entity.data);
              _isMore = entity.more;
            }
          }
        }catch(e){
          toastInfo(msg: '加载失败');
        }
        setState(() {
          _controller.finishLoad(success: _data != null,noMore: !_isMore);
        });
      }
    });
  }
}
