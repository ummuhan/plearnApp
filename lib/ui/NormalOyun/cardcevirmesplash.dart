import 'dart:async';
import 'package:englishapp/ui/NormalOyun/cardCevirme.dart';

import 'package:flutter/material.dart';

class CardCevirmeSplash extends StatefulWidget {
  @override
  _CardCevirmeSplashState createState() => _CardCevirmeSplashState();
}

class _CardCevirmeSplashState extends State<CardCevirmeSplash> {
  @override
  void initState() {
     Timer(Duration(seconds: 5), () {
       //5sn sonra diğer sayfaya geçerek oyunun başlamasını sağlarız.
       Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context) => CardCevirme()));
     });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // backgroundColor: Colors.orange[200],
 body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.orange])),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Are you ready for game ?',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
           
                    fontSize: 25.0)),
          ),
        ),
      ),
    );
  }
}
