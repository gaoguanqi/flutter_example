import 'dart:math';

import 'package:example/common/utils/screen.dart';
import 'package:example/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ListBannerPage extends StatefulWidget {
  @override
  _ListBannerPageState createState() => _ListBannerPageState();
}

class _ListBannerPageState extends State<ListBannerPage> {

  List<String> _list;
  List<String> _banners;


  @override
  void initState() {
    super.initState();
    _list = [];
    _banners = [
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2782555045,2953409065&fm=26&gp=0.jpg',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2152868655,2785352060&fm=26&gp=0.jpg',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3677830246,960026137&fm=26&gp=0.jpg',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3341364585,560607729&fm=26&gp=0.jpg',
    ];
    getListData();
  }

  Future<void> getListData()async{
    await Future.delayed(Duration(seconds: 1),(){
      for(int i = 1; i <= 20; i++){
        _list.add('item---${i}');
      }
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 22,),onPressed: (){
          toastInfo(msg: '返回');
        },),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.fullscreen,color: Colors.white,size: 22,), onPressed: (){
            toastInfo(msg: '扫码');
          }),
        ],
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      extendBody: true,
      body: _bulidBody(context),
    );
  }

  Widget _bulidBody(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: _buildList,itemCount: _list.length + 1,),
    );
  }

  Widget _buildList(BuildContext context, int index) {
    return index == 0 ? _bulidBanner(context,index): _bulidItem(context,index);
  }

  Widget _bulidItem(BuildContext context, int index) {
    return Container(
      alignment: Alignment.centerLeft,
      height: duSetHeight(60),
      child: Text(_list[index - 1],style: TextStyle(color: Colors.white),),
      color: Color.fromARGB(
        255,
        Random.secure().nextInt(255),
        Random.secure().nextInt(255),
        Random.secure().nextInt(255)),
    );
  }

  Widget _bulidBanner(BuildContext context, int index) {
    return ConstrainedBox(
        child: Swiper(
          outer:false,
          autoplay: true,
          itemBuilder: (c, i) {
            return GestureDetector(
              child: Container(
                child:  Container(
                  child: Image.network(_banners[i],fit: BoxFit.cover,),
                ),
              ),
              onTap: (){
                toastInfo(msg: _banners[i]);
              },
            );
          },
          pagination: SwiperPagination(
              margin: EdgeInsets.all(5)
          ),
          itemCount: _banners.length,
        ),
        constraints: BoxConstraints.loose(Size(MediaQuery.of(context).size.width, 170.0)) //控制高度
    );
  }
}
