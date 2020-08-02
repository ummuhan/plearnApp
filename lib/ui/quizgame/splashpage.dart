import 'dart:async';
import 'package:englishapp/ui/quizgame/quizSayfasi.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      //5sn sonra diğer sayfaya geçerek oyunun başlamasını sağlarız.
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => QuizSayfasi()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[300],
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.orange])),
          child: Center(
            child: Text(
              "Quizstart",
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
        ));
  }
}
