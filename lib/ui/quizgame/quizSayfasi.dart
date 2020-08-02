import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/model/kelime.dart';
import 'package:englishapp/ui/quizgame/result.dart';

import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class QuizSayfasi extends StatefulWidget {
  @override
  _QuizSayfasiState createState() => _QuizSayfasiState();
}

//telegrama bak
class _QuizSayfasiState extends State<QuizSayfasi> {
  final Firestore _firestore =
      Firestore.instance; //VERİLERİ ÇEKECEĞİMİZ DATABASE EKLENDİ

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int j = 1;
  int timer = 100;
  bool devam = true;
  List<int> dogruYanlisTutucu = List(20);
  String showtimer = "100";
  Map<String, Color> btncolor = {
    "a": Colors.orange,
    "b": Colors.orange,
    "c": Colors.orange,
    "d": Colors.orange,
  };
  bool canceltimer = false;
  @override
  void initState() {
    // starttimer();

    super.initState();
    geldiMi = false;
    getKelimeListesi();
    eleman = 0;
  }

  // void starttimer() async {
  //   const onesec = Duration(seconds: 1);
  //   Timer.periodic(onesec, (Timer t) {
  //     setState(() {
  //       if (timer < 1) {
  //         t.cancel();
  //         sonrakiSoru();
  //       } else if (canceltimer == true) {
  //         t.cancel();
  //       } else {
  //         timer = timer - 1;
  //       }
  //       showtimer = timer.toString();
  //     });
  //   });
  // }

  Future<void Function()> sonrakiSoru() async {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    setState(() {
      print(dogruYanlisTutucu[0]);
      if (eleman < _tumKelimeler.length - 1) {
        // _tumKelimeler.length-1
        eleman++;
        devam = true;
        print("eleman:   " + eleman.toString());
      } else {
        _userModel.user.puan += marks;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Result(marks: marks)));
      }

      btncolor["a"] = Colors.orange;
      btncolor["b"] = Colors.orange;
      btncolor["c"] = Colors.orange;
      btncolor["d"] = Colors.orange;
    });
  }

  cevapKontrol(String a, String k) {
    if (a == _tumKelimeler[eleman].anlam) {
      print("Anlamm:" + _tumKelimeler[eleman].toString());
      marks += 5;
      dogruYanlisTutucu[eleman] = 1;
      colortoshow = right;
    } else {
      dogruYanlisTutucu[eleman] = 0;
      colortoshow = wrong;
    }

    setState(() {
      btncolor[k] = colortoshow;

      Timer(Duration(seconds: 2), sonrakiSoru);
    });
  }

  List<Kelime> _tumKelimeler; //Tüm verilerin olduğu bizi
  List<String> _myData = List(4);

  bool geldiMi;
  int _elemanSayisi = 20;
  int eleman; //sıfır yapınca çalışıyor 1 ken
  String oankiKelime;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "ERROR",
                  ),
                  content: Text("You Can't Go Back At This Stage."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        backgroundColor: Colors.indigo[200],
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.orange])),
          child: (geldiMi == true)
              ? Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                          //  padding: EdgeInsets.all(15.0),
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Text("What's word meaning?",
                              style: TextStyle(fontSize: 20))),
                    ),

                    //   RandomVeriUret(),
                    Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(_tumKelimeler[eleman].kelime,
                              style: TextStyle(fontSize: 30))),
                    ),
                    randomListeUret(eleman),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  choicebutton(String a, String s) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: SizedBox(
        width: 300.0,
        height: 60.0,
        child: new RaisedButton(
          color: btncolor[s],
          padding: EdgeInsets.all(20.0),
          child: new Text(
            a,
            style: TextStyle(fontSize: 15),
          ),
          onPressed: () => cevapKontrol(a, s),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }

  Future<void> getKelimeListesi() async {
    _tumKelimeler = [];
    for (int i = 0; i < 20; i++) {
      var rng = new Random();
      int a = rng.nextInt(100);

      DocumentSnapshot _document = await Firestore.instance
          .collection("Sozluk")
          .document(a.toString())
          .get();
      Kelime _tekKelime = Kelime.fromMap(_document.data);
      _tumKelimeler.add(_tekKelime);
      print(_tekKelime);
    }
    geldiMi = true;
    setState(() {});

    // QuerySnapshot _querySnapshot = await Firestore.instance
    //     .collection("Sozluk")
    //     .limit(_elemanSayisi)
    //     .getDocuments();
    // for (var snap in _querySnapshot.documents) {
    //   Kelime _tekKelime = Kelime.fromMap(snap.data);
    //   _tumKelimeler.add(_tekKelime);
    // }
    // print(_tumKelimeler[0]);
    // print(_tumKelimeler[1]);
    // print(_tumKelimeler[2]);
    // print(_tumKelimeler[3]);
    // geldiMi = true;

    // setState(() {});
  }

  randomListeUret(int eleman) {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);

    var rng = new Random();
    int cevap = rng.nextInt(4);
    for (var i = 0; i < 4; i++) {
      int deger = rng.nextInt(20);
      if (devam == true) {
        if (i == cevap) {
          _myData[i] = _tumKelimeler[eleman].anlam.toString();
          print("Cevabın bulunduğu şık  " + cevap.toString());
          print(_userModel.user.puan);
        } else if (deger == eleman) {
          deger = rng.nextInt(20);
        } else {
          _myData[i] = _tumKelimeler[deger].anlam.toString();
        }
      }
    }
    devam = false;
    for (var i = 0; i < 4; i++) {
      print("Uretilen sayilar  " + _myData[i].toString());
    }
    return Expanded(
      flex: 5,
      child: Container(
        margin: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            choicebutton(_myData[0], "a"),
            choicebutton(_myData[1], "b"),
            choicebutton(_myData[2], "c"),
            choicebutton(_myData[3], "d"),
          ],
        ),
      ),
    );
  }
}
