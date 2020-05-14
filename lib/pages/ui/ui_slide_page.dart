import 'package:example/common/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class UIslidePage extends StatefulWidget {
  @override
  _UIslidePageState createState() => _UIslidePageState();
}

class _UIslidePageState extends State<UIslidePage> {

  List<String> assetsPaths = [
    'assets/images/image1.jpg',
    'assets/images/image2.png',
    'assets/images/image3.jpg',
  ];

  int _index = 0;

  SwiperController _swiperController;

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Swiper(itemCount: assetsPaths.length,itemBuilder: (BuildContext contex,int index){
//              toastInfo(msg: 'swiper:${index}');
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(assetsPaths[index],fit: BoxFit.cover,),
              );
            },
              controller: _swiperController,
              loop: false, //无限轮播模式开关
                onIndexChanged: (int index){ //当用户手动拖拽或者自动播放引起下标改变的时候调用
                  setState(() {
                    _index = index;
                  });
                },
            ),
           SafeArea(
             child: Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),
                   Text('Skip',style: TextStyle(color: Colors.white),)
                 ],
               ),
             ),
           ),
           Positioned(
             width: MediaQuery.of(context).size.width,
             child: Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       Container(
                         margin: EdgeInsets.all(2),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(4),
                           color: 0 == _index ? Colors.pink: Colors.pink[200] ,
                         ),
                         width: duSetWidth(6),
                         height: duSetHeight(6),
                       ),
                       Container(
                         margin: EdgeInsets.all(2),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(4),
                           color: 1 == _index ? Colors.pink: Colors.pink[200] ,
                         ),
                         width: duSetWidth(6),
                         height: duSetHeight(6),
                       ),
                       Container(
                         margin: EdgeInsets.all(2),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(4),
                           color: 2 == _index ? Colors.pink: Colors.pink[200] ,
                         ),
                         width: duSetWidth(6),
                         height: duSetHeight(6),
                       ),
                     ],
                   ),
                   FloatingActionButton(mini: true,onPressed: (){
                     _index++;
                     if(_index == assetsPaths.length){
                       Navigator.of(context).dispose();
//                       ExtendedNavigator.rootNavigator.pushNamed(Routes.playerLoginPageRoute);
                     }else{
                       setState(() {
                         _swiperController.next();
                       });
                     }
                   },child: Icon(Icons.navigate_next,color: Colors.white,),backgroundColor: Colors.pink,),
                 ],
               ),
             ),bottom: duSetHeight(40),),
          ],
        ),
      ),
    );
  }
}
