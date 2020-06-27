import 'package:flutter/material.dart';

class EventBusPage1 extends StatefulWidget {
  @override
  _EventBusPage1State createState() => _EventBusPage1State();
}

class _EventBusPage1State extends State<EventBusPage1> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('event bus page'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('data-->>>$_count'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}
