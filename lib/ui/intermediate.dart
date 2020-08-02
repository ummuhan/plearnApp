import 'package:englishapp/ui/drawerMenu.dart';
import 'package:englishapp/ui/gamespage.dart';
import 'package:englishapp/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IntermediatePage extends StatefulWidget {
  const IntermediatePage({Key key}) : super(key: key);

  @override
  _IntermediatePageState createState() => _IntermediatePageState();
}

class _IntermediatePageState extends State<IntermediatePage> {
  @override
  Widget build(BuildContext context) {
    int secilenMenuItem = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[300],
        title: Text("INTERMEDIATE",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star),
            color: Colors.pink,
            tooltip: 'Give Point',
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
            color: Colors.blue,
            tooltip: 'Share',
          )
        ],
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
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.pink.withOpacity(0.6),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              title: Text('Game'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('Chat Page'),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: secilenMenuItem,
          fixedColor: Colors.black,
          onTap: (index) {
            setState(() {
              secilenMenuItem = index;
              if (index == 0) {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(user: null),
                  ),
                )
                    .then((bb) {
                  secilenMenuItem = 0;
                });
              } else if (index == 1) {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => GamesPage(),
                  ),
                )
                    .then((bb) {
                  secilenMenuItem = 0;
                });
              } else if (index == 2) {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => HomePage(user: null)))
                    .then((bb) {
                  secilenMenuItem = 0;
                });
              }
            });
          },
        ),
      ),
      drawer: DrawerMenu(
        onSignOut: null,
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
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Image.asset(imgPath, fit: BoxFit.cover, height: 50.0),
            SizedBox(height: 10.0),
            Text(
              name,
              style: TextStyle(
                  fontFamily: 'Quicksand', color: Colors.white, fontSize: 30.0),
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
    );
  }
}
