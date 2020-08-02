
import 'package:englishapp/ui/quizgame/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key key}) : super(key: key);

  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[300],
        title: Text("STARTER",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          _buildCard(
            'images/globemojies/027-happy.png',
            'LEVEL 1',
            '0xFF039BE5',
            '',
          ),
          _buildCard(
            'images/globemojies/027-happy.png',
            'LEVEL 2',
            '0xFFEC407A',
            '',
          ),
          _buildCard(
            'images/globemojies/027-happy.png',
            'LEVEL 3',
            '0xFF9C27B0',
            '',
          ),
          _buildCard(
            'images/globemojies/027-happy.png',
            'LEVEL 4',
            '0xFF4DB6AC',
            '',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      String imgPath, String name, String cardColor, String aciklama) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        height: 170.0,
        width: 100.0,
        decoration: BoxDecoration(
            color: Color(int.parse(cardColor)),
            borderRadius: BorderRadius.circular(15.0)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SplashPage()));
          },
          child: Column(
            children: [
              SizedBox(height: 15.0),
              Image.asset(imgPath, fit: BoxFit.cover, height: 50.0),
              SizedBox(height: 10.0),
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.white,
                    fontSize: 30.0),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: 270.0,
                  lineHeight: 14.0,
                  percent: 0.5,
                  center: Text(
                    "50.0%",
                    style: new TextStyle(fontSize: 12.0),
                  ),
                  trailing: Icon(Icons.mood),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  backgroundColor: Colors.grey,
                  progressColor: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
