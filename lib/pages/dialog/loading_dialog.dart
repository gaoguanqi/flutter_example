import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends Dialog{
  final String text; //内容文本
  final bool isCancel; //是否点击外部或返回键关闭Dialog
  final Color color; //背景颜色
  final double indicatorRadius; //菊花半径
  final Color textColor; //文本颜色
  final double textSize;//字体大小

  LoadingDialog({
    Key key,
    @required this.text,
    this.isCancel = true,
    this.color = Colors.white,
    this.indicatorRadius = 12,
    this.textColor = Colors.black87,
    this.textSize = 14,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
//      color: Colors.transparent, // 背景
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildWidget(),
          ),
        ),
      ),
    );
  }

 List<Widget> _buildWidget() {
   return [
     CupertinoActivityIndicator(animating: true, radius: indicatorRadius),
     Container(
         margin: EdgeInsets.only(top: 12),
         child: Text(
           text,
           style: TextStyle(
             color: textColor,
             fontSize: textSize,
           ),
         ),
     ),
   ];
 }
}