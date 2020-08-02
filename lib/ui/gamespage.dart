import 'package:englishapp/model/gamemodel.dart';
import 'package:englishapp/ui/NormalOyun/cardcevirmesplash.dart';
import 'package:englishapp/ui/eslestirmeOyunlari/havadurumueslestirme.dart';
import 'package:englishapp/ui/eslestirmeOyunlari/hayvaneslestirme.dart';
import 'package:englishapp/ui/eslestirmeOyunlari/meslekeslestirme.dart';
import 'package:englishapp/ui/eslestirmeOyunlari/meyveeslestirme.dart';
import 'package:englishapp/ui/eslestirmeOyunlari/renkeslestirme.dart';
import 'package:englishapp/ui/eslestirmeOyunlari/yiyecekeslestirme.dart';

import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  int secilenMenuItem = 0;
  List<GameModel> tumOyunlar;
  @override
  void initState() {
    //Verileri initstate de oluşturuyoruz.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.orange])),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.all(15.0),
                width: MediaQuery.of(context).size.width - 30.0,
                height: MediaQuery.of(context).size.height - 50.0,
                child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    _buildCard('Fruit Pairing Game',
                        'images/karisik/014-gardening tools.png', 0),
                    _buildCard(
                        'Cart Flip Game', 'images/karisik/025-sakura.png', 1),
                    _buildCard(
                        'Animal Pairing Game', 'images/karisik/001-bee.png', 2),

                    _buildCard(
                        'Color Pairing Game', 'images/karisik/002-bird.png', 3),
                    _buildCard('Weather Pairing Game',
                        'images/karisik/006-spring.png', 4),
                    _buildCard('Profession Pairing Game',
                        'images/karisik/029-sunflower.png', 5),
                    _buildCard('Food Pairing Game',
                        'images/karisik/015-harvest.png', 6),

             

                    //   _buildCard(
                    //       'Vegetables Game',
                    //       'images/helpicons/043-laughing.png',
                    //       false,
                    //       true,

                    //       2),
                  ],
                )),
            SizedBox(height: 15.0)
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String name, String imgPath, int index) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MeyveEslestirme()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CardCevirmeSplash()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HayvanEslestirme()));
          } else if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RenkEslestirme()));
          } else if (index == 4) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HavaDurumuEslestirme()));
          } else if (index == 5) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MeslekEslestirme()));
          } else if (index == 6) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => YiyecekEslestirme()));
          }
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.orange, spreadRadius: 3.0, blurRadius: 5.0)
              ],
              color: Colors.orange),
          child: Column(
            children: [
              SizedBox(height: 30.0),
              Container(
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(name,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quicksand',
                        fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
