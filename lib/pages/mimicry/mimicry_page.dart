import 'package:example/common/utils/screen.dart';
import 'package:flutter/material.dart';

class MimicryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Michale is Wallet',style: TextStyle(fontSize: duSetFontSize(24),fontWeight: FontWeight.bold,color: Colors.black),),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                boxShadow: customShadow,
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  
                  Center(
                    child: Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),),
    );
  }
}



Color primaryColor = Color(0xFFCADCED);
List<BoxShadow> customShadow = [
  BoxShadow(
    color: Colors.white.withOpacity(0.5),
    spreadRadius:  -5,
    offset: Offset(-5,-5),
    blurRadius: 30,
  ),

  BoxShadow(
    color: Colors.blue[900].withOpacity(0.2),
    spreadRadius:  2,
    offset: Offset(7,7),
    blurRadius: 20,
  ),
];

