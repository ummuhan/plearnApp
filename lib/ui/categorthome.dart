import 'package:flutter/material.dart';

class CategoryHome extends StatefulWidget {
  @override
  _CategoryHomeState createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _buildPageCard(
            'images/globemojies/040-sad.png',
            'STARTER',
            'sdlkfjsgfkşthgflhigggggggggggggggggggggggggggggghlfksşkfhşlskhlgfhghşghks',
            '0xFFEC407A', //0xFFF8BBD0
            'StartLevel()'),
        _buildPageCard(
            'images/globemojies/027-happy.png',
            'INTERMEDIATE',
            'sdlkfjsgfkşthgflhigggggggggggggggggggggggggggggghlfksşkfhşlskhlgfhghşghks',
            '0xFF039BE5',
            'StartLevel()'), //0xFFA5D6A7
        _buildPageCard(
            'images/globemojies/013-happy.png',
            'EXPERT',
            'sdlkfjsgfkşthgflhigggggggggggggggggggggggggggggghlfksşkfhşlskhlgfhghşghks',
            '0xFF4DB6AC',
            'StartLevel()'),
        _buildPageCard(
            'images/globemojies/029-love.png', //0xFFCE93D8
            'MASTERY',
            'sdlkfjsgfkşthgflhigggggggggggggggggggggggggggggghlfksşkRADJKLSAFFFFFFFFFFFFFFŞDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFFFFFFFFFFFF',
            '0xFF9C27B0',
            'StartLevel()'),
      ],
    );
  }

  Widget _buildPageCard(String imgPath, String name, String aciklama,
      String cardColor, String pagePath) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
          height: 100.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: Color(int.parse(cardColor)),
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(children: [
            SizedBox(height: 15.0),
            Image.asset(imgPath, fit: BoxFit.cover, height: 100.0),
            SizedBox(height: 10.0),
            Text(
              name,
              style: TextStyle(
                  fontFamily: 'Quicksand', color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text(aciklama,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.white,
                      fontSize: 12.0)),
            ),
            SizedBox(height: 15.0),
            InkWell(
                onTap: () {},
                child: Container(
                  height: 30.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFEA00),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Center(
                    child: Text(
                      'Start',
                      style: TextStyle(
                          fontFamily: 'Quicksand', color: Colors.black),
                    ),
                  ),
                ))
          ])),
    );
  }
}
