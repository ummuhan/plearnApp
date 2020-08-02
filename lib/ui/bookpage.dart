import 'package:englishapp/ui/gamespage.dart';
import 'package:englishapp/ui/homepage.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  int secilenMenuItem = 0;
  @override
  void initState() {
    //Verileri initstate de oluşturuyoruz.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent.withOpacity(0.6),
          title: Text(
            "LIBRARY",
            style: TextStyle(
                fontFamily: 'Quicksand', color: Colors.black, fontSize: 30.0),
          )),
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard(
                      'Kitap1', 'images/gallow.png', false, false, context),
                  _buildCard('Kitap2', 'images/helpicons/002-artist.png', true,
                      false, context),
                  _buildCard('Kitap3', 'images/helpicons/034-devil.png', false,
                      true, context),
                  _buildCard('Kitap4', 'images/helpicons/033-eat.png', false,
                      false, context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.greenAccent.withOpacity(0.6),
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
    );
  }

  Widget _buildCard(
      String name, String imgPath, bool added, bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        /* onTap: () {
          // Navigator.of(context).push(
          /*MaterialPageRoute(builder: (context) => CookieDetail(
                    assetPath: imgPath,
                    cookieprice:price,
                    cookiename: name
                  )));*/
        },*/
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          /*child: Column(
            children: [
              SizedBox(height: 15.0),
              Image.asset(imgPath, fit: BoxFit.cover, height: 100.0),
              SizedBox(height: 10.0),
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 20.0),
              ),*/
          child: Column(
            children: [
              SizedBox(height: 30.0),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text(name,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Quicksand',
                      fontSize: 17.0)),
            ],
          ),
        ),
      ),
    );
  }
}
