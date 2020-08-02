import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RandomVeri extends StatefulWidget {
  RandomVeri({Key key}) : super(key: key);

  @override
  _RandomVeriState createState() => _RandomVeriState();
}

class _RandomVeriState extends State<RandomVeri> {
   final Firestore _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random veri"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: randomVeriUret,
              color: Colors.green,
              child: Text("Random sayı üret"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> randomVeriUret() async {
    List<int>sayi=List(5);
    var rng = new Random();
    for (var i = 0; i < 5; i++) {
      int a=rng.nextInt(10);
      //print(a);//10 adet veri üretiyor.
     sayi[i]=a;
    }

  String a = '1'; 
  List<String>Anlam=List(5);
  List<String>Kelime=List(5);
  for(var i=0;i<5;i++){
    String b=sayi[i].toString();
  DocumentSnapshot snapshot =
      await _firestore.collection('sozluk').document(a).get();
      Kelime[i]=snapshot.data[b][0].toString();
      Anlam[i]=snapshot.data[b][1].toString();
  debugPrint("Document 1 data" + snapshot.data[b].toString()); //İşime yarar
  debugPrint(Kelime[i]);  
  debugPrint(Anlam[i]);
}
  }
}



