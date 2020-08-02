import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/model/success.dart';
import 'package:englishapp/ui/homepage.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  final int marks;
  Result({this.marks});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final Firestore _firestore =
      Firestore.instance; //VERİLERİ ÇEKECEĞİMİZ DATABASE EKLENDİ

  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      //5sn sonra diğer sayfaya geçerek oyunun başlamasını sağlarız.
    });
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.pink[200],
      body:Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.orange])),child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                "Result Page",
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4, child: Image.asset('images/helpicons/029-boxing.png')),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sum Question :  20",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Sum Point :" + widget.marks.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Sum Wrong :" + (100 - widget.marks).toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topCenter,
              child: RaisedButton(
                color: Colors.purple[400],
                onPressed: () {
                  Success _kaydedilecekSuccess = Success(
                    userID: _userModel.user.userID.toString(),
                    successID: randomSayiUret().toString(),
                    wrong: 100 - widget.marks,
                    point: widget.marks,
                    renk: renkSec(),
                  );

                  var sonuc = _userModel.saveSuccess(_kaydedilecekSuccess);
                  if (sonuc != null) {}
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomePage(user: _userModel.user)));
                },
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Save to my achievements",
                  style: TextStyle(fontSize: 15),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topCenter,
              child: RaisedButton(
                color: Colors.purple[400],
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomePage(user: _userModel.user)));
                },
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Skip At",
                  style: TextStyle(fontSize: 15),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  String randomSayiUret() {
    int rastgeleSayi = Random().nextInt(999999);
    return rastgeleSayi.toString();
  }

  renkSec() {
    if (widget.marks > 85) {
      return '0xFF4CAF50';
    } else if (widget.marks > 50 && widget.marks < 85) {
      return '0xFFFF9800';
    } else if (widget.marks > 25 && widget.marks < 50) {
      return '0XFFB71C1C';
    } else {
      return '0xFF212121';
    }
  }
}
