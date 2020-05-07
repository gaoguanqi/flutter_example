import 'package:example/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GridBannerPage extends StatefulWidget {
  @override
  _GridBannerPageState createState() => _GridBannerPageState();
}

class _GridBannerPageState extends State<GridBannerPage> {

  List<String> list;
  List<String> banners;

  ScrollController _controller;
  int _count = 10;
  bool _isLoding = false;
  bool _isRefreshing = false;
  String loadingText = "加载中.....";

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    list = [];
    banners = [
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2782555045,2953409065&fm=26&gp=0.jpg',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2152868655,2785352060&fm=26&gp=0.jpg',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3677830246,960026137&fm=26&gp=0.jpg',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3341364585,560607729&fm=26&gp=0.jpg',
    ];
    getListData();
  }

  Future<void> getListData()async{
    await Future.delayed(Duration(seconds: 1),(){
      for(int i = 1; i <= 30; i++){
        list.add('item---${i}');
      }
      setState(() {});
    });
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      physics: ScrollPhysics(),
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          title: const Text('复杂布局'),
          leading: Icon(Icons.arrow_back),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 170,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  banners[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: banners.length,
              autoplay: true,
              pagination: SwiperPagination(),
            ),
          ),
        ),
         SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: duSetHeight(120),
            child: Image.network('https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2075903360,405209795&fm=26&gp=0.jpg',fit: BoxFit.cover,),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('SliverGrid item $index'),
              );
            },
            childCount: _count,
          ),
        ),
         SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.green,
              child: SizedBox(
                  child: Text(
                    'SliverFixedExtentList',
                    style: TextStyle(fontSize: 16),
                  )),
            )),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('SliverFixedExtentList item $index'),
              );
            },
            childCount: _count + 20,
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.green,
              child: SizedBox(
                  child: Text(
                    'SliverGrid',
                    style: TextStyle(fontSize: 16),
                  )),
            )),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('SliverGrid item2 $index'),
              );
            },
            childCount: _count + 10,
          ),
        ),
         SliverToBoxAdapter(
          child: Visibility(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Center(
                child: Text(loadingText),
              ),
            ),
            visible: _isLoding,
          ),
        ),
      ],
    );
  }

}
