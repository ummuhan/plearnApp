import 'dart:async';

import 'package:englishapp/ui/NormalOyun/cardcevirmesplash.dart';
import 'package:flutter/material.dart';
import 'package:englishapp/model/kelime.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardCevirme extends StatefulWidget {
  @override
  _CardCevirmeState createState() => _CardCevirmeState();
}

class _CardCevirmeState extends State<CardCevirme>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  bool devam = true;
  bool geldiMi;

  @override
  void initState() {
    super.initState();
    geldiMi = false;
    getKelimeListesi();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<Kelime> _tumKelimeler;
  List<String> _tumRenkler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (geldiMi == true)
          ? Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.purple, Colors.orange])),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Container(
                      padding: EdgeInsets.all(25.0),
                      width: MediaQuery.of(context).size.width - 30.0,
                      height: MediaQuery.of(context).size.height - 50.0,
                      child: GridView.count(
                        crossAxisCount: 3,
                        primary: false,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 0.8,
                        children: <Widget>[
                          _buildCard(
                              _tumKelimeler[0].kelime, 0, _tumRenkler[0]),
                          _buildCard(
                              _tumKelimeler[1].kelime, 1, _tumRenkler[1]),
                          _buildCard(
                              _tumKelimeler[2].kelime, 2, _tumRenkler[2]),
                          _buildCard(
                              _tumKelimeler[3].kelime, 3, _tumRenkler[3]),
                          _buildCard(
                              _tumKelimeler[4].kelime, 4, _tumRenkler[4]),
                          _buildCard(
                              _tumKelimeler[5].kelime, 5, _tumRenkler[5]),
                          _buildCard(
                              _tumKelimeler[6].kelime, 6, _tumRenkler[6]),
                          _buildCard(
                              _tumKelimeler[7].kelime, 7, _tumRenkler[7]),
                          _buildCard(
                              _tumKelimeler[8].kelime, 8, _tumRenkler[8]),
                          _buildCard(
                              _tumKelimeler[9].kelime, 9, _tumRenkler[9]),
                          _buildCard(
                              _tumKelimeler[10].kelime, 10, _tumRenkler[10]),
                          _buildCard(
                              _tumKelimeler[11].kelime, 11, _tumRenkler[11]),
                          _buildCard(
                              _tumKelimeler[12].kelime, 12, _tumRenkler[12]),
                          _buildCard(
                              _tumKelimeler[13].kelime, 13, _tumRenkler[13]),
                          _buildCard(
                              _tumKelimeler[14].kelime, 14, _tumRenkler[14]),
                        ],
                      )),
                  SizedBox(height: 15.0)
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildCard(String kelime, int id, String renk) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          if (devam == true) {
            _degistir(id);
          }
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.orange.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Color(int.parse(renk)),
            ),
            child: Center(
              child: Text(kelime,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0)),
            )),
      ),
    );
  }

  Future<void> getKelimeListesi() async {
    _tumKelimeler = [];
    _tumRenkler = [];
    for (int i = 0; i < 15; i++) {
      var rng = new Random();
      int a = rng.nextInt(100);

      DocumentSnapshot _document = await Firestore.instance
          .collection("Sozluk")
          .document(a.toString())
          .get();
      Kelime _tekKelime = Kelime.fromMap(_document.data);
      _tumKelimeler.add(_tekKelime);
      _tumRenkler.add("0xFFFF9800");
      print(_tekKelime);
    }
    geldiMi = true;
    setState(() {});
  }

  _degistir(int id) {
    devam = false;
    String kelime = _tumKelimeler[id].kelime;

    setState(() {
      _tumRenkler[id] = "0xFFAB47BC";
      _tumKelimeler[id].kelime = _tumKelimeler[id].anlam;

      Timer(Duration(seconds: 1), () {
        _tumKelimeler[id].kelime = kelime;
        _tumRenkler[id] = "0xFFFF9800";
      });

      devam = true;
      //5sn sonra diğer sayfaya geçerek oyunun başlamasını sağlarız.
    });
  }
}
