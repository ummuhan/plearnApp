import 'package:englishapp/model/user_model.dart';
import 'package:englishapp/ui/categorthome.dart';
import 'package:englishapp/viewmodel/user_model.dart';
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

  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    bool sonuc = await _userModel.signOut();
    return sonuc;
  }

  int secilenMenuItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu, color: Colors.grey),
              onPressed: () {},
            ),
            Container(
              height: 50.0,
              width: 300.0,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              child: Center(
                child: Text("PLEARN",
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
              ),
            ),
          ],
        ),
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
              _buildFoodItem(
                  'images/helpicons/029-boxing.png', 'Games', 'gamespage();'),
              _buildFoodItem(
                  'images/helpicons/038-think.png', 'Chats', 'gamespage();'),
              _buildFoodItem(
                  'images/helpicons/013-reading.png', 'Reading', 'gamespage();')
            ],
          ),
        )
      ],
    ));
  }

  Widget _buildFoodItem(String imgPath, String name, String pagePath) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            child: InkWell(
              onTap: () {},
            ),
            height: 125.0,
            width: 125.0,
          ),
          Positioned(
              left: 15.0,
              child: Container(
                height: 20.0,
                width: 25.0,
                decoration: BoxDecoration(
                    color: Color(0xFFF8BBD0), //0xFFD2691F
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
