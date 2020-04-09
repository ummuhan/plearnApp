import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("ummuhanoksuz"),
          accountEmail: Text("ummuhanoksuz1@gmail.com"),
          currentAccountPicture: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR87Qkxf7imN1MTHtRD2LB8DEX-d0r871F6H8BypJg2RF8tqMlY&usqp=CAU"),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: () {},
                splashColor: Colors.amber,
                child: ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text("Anasayfa"),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

/*class DrawerMenu extends StatefulWidget {
  final AuthBase authServise;
  final Function onSignOut;
  final User user;

  const DrawerMenu(
      {Key key,
      @required this.authServise,
      this.user,
      @required this.onSignOut})
      : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .start, //Yukarıdan aşağıya doğru çalışmasını sağlar.
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50),
              //color:Colors.green.shade300,
              child: Image.asset('images/Plearn.jpeg'),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.all_inclusive),
                  title: Text(
                    "Settings",
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Divider(
                  height: 14.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.games),
                  title: Text(
                    "Games",
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {
                    GameScreen(hangmanObject: null);
                  },
                ),
                Divider(
                  height: 14.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.gamepad),
                  title: Text(
                    "Online Games",
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Divider(
                  height: 14.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.chat),
                  title: Text(
                    "Live Chat",
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Divider(
                  height: 14.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(
                    "Your Success",
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Divider(
                  height: 14.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.comment),
                  title: Text(
                    "Contact us",
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Divider(
                  height: 14.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.cancel),
                  title: Text(
                    "Exit",
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
*/
