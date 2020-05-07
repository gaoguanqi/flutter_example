import 'package:example/common/utils/screen.dart';
import 'package:example/common/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {


  List<String> cloumList = [];
  List<String> goodsList = [];

  String cloumItem;

  @override
  void initState() {
    super.initState();
    getCloumData();
    getGoodsData();
  }



  Future<void> getCloumData()async{
    await Future.delayed(Duration(seconds: 4),(){
      for(int i = 0; i < 20; i++){
        cloumList.add('栏目${i+1}');
      }
      setState(() {
        cloumItem = cloumList[0]; //默认选中第一个
      });
    });
  }


  Future<void> getGoodsData()async{
    await Future.delayed(Duration(seconds: 5),(){
      for(int i = 0; i < 30; i++){
        goodsList.add('商品${i+1}');
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
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      backgroundColor: Colors.blue,
      extendBody: true,
      body: _bulidBody(context),
    );
  }

  Widget _bulidBody(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: (cloumList == null || cloumList.length == 0) ? bulidEmpty('cloum empty~~') :ListView.separated(itemBuilder: buildCloumItem, separatorBuilder: _buildCloumSeparator, itemCount: cloumList.length)
            ), flex: 1,
          ),
          Padding(padding: EdgeInsets.only(left: duSetWidth(6)),),
          Expanded(
            child: Container(
              color: Colors.white,
              child: (goodsList == null || goodsList.length == 0) ? bulidEmpty('goods empty~') :GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //横轴元素个数
                  mainAxisSpacing: 8,//纵轴间距
                    crossAxisSpacing: 4,//横轴间距
                    childAspectRatio: 1.0, //子组件宽高长度比例
              ), itemBuilder: buildGoodsItem,itemCount: goodsList.length,
              ),
            ), flex: 3,
          ),
        ],
      ),
    );
  }


  Widget bulidEmpty(String msg){
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoActivityIndicator(animating: true, radius: 9),
            Text(msg),
          ],
        ),
      ),
    );
  }

  Widget buildCloumItem(BuildContext context, int index) {
    return Center(
      child: MaterialButton(
        child: Container(
          alignment: Alignment.center,
          child: Text(cloumList[index]),
        ),
        onPressed: (){
          toastInfo(msg: '点击了${cloumList[index]}');
          setState(() {
            cloumItem = cloumList[index];
          });
        },
      ),
    );
  }


  Widget buildGoodsItem(BuildContext context, int index) {
    return  GestureDetector(
      child: Container(
        color: Colors.pink,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: duSetWidth(66),
              height: duSetHeight(66),
              alignment: Alignment.bottomCenter,
              child: Image.network('https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2386979420,3709252419&fm=26&gp=0.jpg',fit: BoxFit.cover,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(cloumItem,style: TextStyle(
                  fontSize: duSetFontSize(12),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),),
                Text(goodsList[index],style: TextStyle(
                  fontSize: duSetFontSize(12),
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),),
              ],
            ),
          ],
        ),
      ),
      onTap: (){
        toastInfo(msg: '${cloumItem} -- ${goodsList[index]}');
      },
    );
  }

  
  Widget _buildCloumSeparator(BuildContext context, int index) {
    return Divider(height: 1,color: Colors.black12,);
  }

}
