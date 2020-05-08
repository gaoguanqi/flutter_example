import 'package:example/common/utils/screen.dart';
import 'package:example/common/widgets/toast.dart';
import 'package:flutter/material.dart';
class AnimPage extends StatefulWidget {
  @override
  _AnimPageState createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage> with TickerProviderStateMixin{

  AnimationController _animationController;
  bool isForward = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animationController.addStatusListener((status){
        if(status == AnimationStatus.completed){ //正向执行 结束时会回调此方法
          toastInfo(msg: 'completed');
          _animationController.repeat();
        }else if(status == AnimationStatus.dismissed){ //反向执行 结束时会回调此方法
          toastInfo(msg: 'dismissed');
        }else if(status == AnimationStatus.forward){
          toastInfo(msg: 'forward');
        }else if(status == AnimationStatus.reverse){
          toastInfo(msg: 'reverse');
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[50],Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                //旋转动画
                child: RotationTransition(
                  //设置动画旋转中心
                  alignment: Alignment.center,
                  //动画控制器
                  turns: _animationController,
                  //执行动画的widget
                  child: Icon(Icons.ac_unit,color: Colors.white,),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(onPressed: (){
                if(isForward){
                  _animationController.repeat();
                }else{
                  _animationController.forward();
                  isForward = true;
                }
              }, child: Text('开始',style: TextStyle(color: Colors.white),),color: Colors.green,),
              FlatButton(onPressed: (){
                _animationController.stop();
              }, child: Text('结束',style: TextStyle(color: Colors.white),),color: Colors.deepOrange,),

              Stack(
                children: <Widget>[
                  Icon(Icons.home,color: Colors.blue,),
                  Positioned(
                    right: duSetWidth(1),
                    top: duSetHeight(1),
                    child: Container(
                    alignment: Alignment.center,
                    child: Text('3',style: TextStyle(color: Colors.white,fontSize: duSetFontSize(8)),),
                    width: duSetWidth(13),
                    height: duSetHeight(13),
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(14/2),
                    ),
                  ),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


