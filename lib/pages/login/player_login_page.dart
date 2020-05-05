import 'dart:async';

import 'package:example/common/utils/screen.dart';
import 'package:example/common/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerLoginPage extends StatefulWidget {
  @override
  _PlayerLoginPageState createState() => _PlayerLoginPageState();
}

class _PlayerLoginPageState extends State<PlayerLoginPage> {
  //网络视频
  final String VIDEO_URL =
      'https://video.pearvideo.com/mp4/third/20190730/cont-1584187-10136163-164150-hd.mp4';

  // 声明视频控制器
  VideoPlayerController _controller;

  bool isCheck =  false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(VIDEO_URL)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        Timer.periodic(Duration(seconds: 15), (Timer time) {
          print(time);
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          _buildPlayer(),
          Positioned(top: duSetHeight(40), child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('登录',
                  style: TextStyle(
                  fontSize: duSetFontSize(30),
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                 ),
              ),
              SizedBox(height: duSetHeight(50),),
              Text('视频背景登录页面',
                style: TextStyle(
                  fontSize: duSetFontSize(15),
                  color: Colors.white,
                ),
              ),
            ],
          )),
          Positioned(bottom: duSetHeight(26), child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildWeiXinButton(),
              SizedBox(height: duSetHeight(8),),
              _buildLoginButton(),
              Row(
                children: <Widget>[
                  SizedBox(height: duSetHeight(16),),
                  Checkbox(value: isCheck, onChanged: (bool val){
                    setState(() {
                      this.isCheck = val;
                    });
                  },
                    activeColor: Colors.yellow,
                  ),

                  Text('我已阅读并同意《服务协议》及《隐私政策》',style: TextStyle(
                    color: Colors.white,
                    fontSize: duSetFontSize(13),
                  ),),
                ],
              ),
            ],
          ),)
        ],
      ),
    );
  }

  Widget _buildWeiXinButton() {
      return RaisedButton(onPressed: (){
        toastInfo(msg: 'weixin---$isCheck');
      },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Container(
          width: duSetWidth(200),
          height: duSetHeight(48),
          alignment: Alignment.center,
          child: Text('微信登录',style: TextStyle(
            fontSize: duSetFontSize(15),
            fontWeight: FontWeight.bold,
          ),),
        ),
        color: Color(0xffFFDB2E),
        textColor: Color(0xff202326),
        elevation: 0,
    );
  }

  Widget _buildLoginButton() {
    return RaisedButton(onPressed: (){
      toastInfo(msg: 'login---$isCheck');
    },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Container(
        alignment: Alignment.center,
        width: duSetWidth(200),
        height: duSetHeight(48),
        child: Text('手机号登录',style: TextStyle(
          fontSize: duSetFontSize(15),
          fontWeight: FontWeight.bold,
        ),),
      ),
      color: Colors.black87,
      textColor: Colors.white,
      elevation: 0,
    );
  }

  Widget _buildPlayer() {
    ///使用Transform.scale对视频进行缩放，
    ///我们想要的效果就是不管视频是什么比率，
    ///都可以平铺无拉伸的显示。Center让视频放大以后居中显示，
    ///缩放比为_controller.value.aspectRatio /MediaQuery.of(context).size.aspectRatio，
    ///用视频的宽高比除以设备的宽高比。
    return Transform.scale(
      scale: _controller.value.aspectRatio/MediaQuery.of(context).size.aspectRatio * 1.01,
      child: Center(
        child: Container(
          child: _controller.value.initialized ?
          AspectRatio(aspectRatio: _controller.value.aspectRatio,child: VideoPlayer(_controller)):Text('正在加载',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
