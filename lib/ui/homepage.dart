import 'package:englishapp/model/user.dart';
import 'package:englishapp/ui/bookpage.dart';
import 'package:englishapp/ui/categorthome.dart';
import 'package:englishapp/ui/drawerMenu.dart';
import 'package:englishapp/ui/gamespage.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:englishapp/widgets/common_widget/platform_duyarli_alert.dart';
import 'package:englishapp/widgets/tabPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage({Key key, @required this.user, Null Function() onsignOut})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 4);
  }

  int secilenMenuItem = 0;

  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[300],
        title: Text("PLEARN",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 30.0)),
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
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('ALL LEVELS',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Starter',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Elemantary',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Pre Intemediate',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Intermediate',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 375.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new CategoryHome(),
                new CategoryHome(),
                new CategoryHome(),
                new CategoryHome(),
                // AnasayfaWiget(AnaText: "Deneme", onTap:=>GamesPage(context), ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Options',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildFoodItem('images/helpicons/029-boxing.png', 'Games', 0),
                _buildFoodItem('images/helpicons/038-think.png', 'Chats', 1),
                _buildFoodItem('images/helpicons/013-reading.png', 'Reading', 2)
              ],
            ),
          )
        ],
      ),
      drawer: DrawerMenu(
        onSignOut: null,
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String name, int index) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 400.0,
            width: 125.0,
          ),
          Positioned(
              //Üstte
              left: 15.0,
              child: Container(
                height: 20.0,
                width: 25.0,
                decoration: BoxDecoration(
                    color: Color(0xFFD2691F),
                    borderRadius: BorderRadius.circular(7.0)),
              )),
          Positioned(
            top: 7.0,
            child: Container(
              height: 110.0,
              width: 125.0,
              decoration: BoxDecoration(
                  color: Color(0xFFF8BBD0), //0xFFAAC2A5
                  borderRadius: BorderRadius.circular(10.0)),
              child: GestureDetector(
                //Gesture detector yapısı sayesinde kolayca routing işlemlerini yapabiliriz.
                onTap: () {
                  if (index == 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GamesPage()));
                  } else if (index == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => tabPage()));
                  } else if (index == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BooksPage()));
                  }
                },
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Image.asset(
                      imgPath,
                      fit: BoxFit.cover,
                      height: 70.0,
                    ),
                    Text(name,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 15.0,
              child: Container(
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                    color: Color(0xFFFE9741),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.0),
                        bottomRight: Radius.circular(7.0),
                        bottomLeft: Radius.circular(7.0))),
              )),
        ],
      ),
    );
  }
}
