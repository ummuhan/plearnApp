import 'package:englishapp/model/user_model.dart';
import 'package:englishapp/screens/game/hangman.dart/screens/game_screen.dart';
import 'package:englishapp/services/auth_base.dart';
import 'package:flutter/material.dart';

class yanMenu extends StatefulWidget {
  final AuthBase authServise;
  final Function onSignOut;
  final User user;

  const yanMenu(
      {Key key,
      @required this.authServise,
      this.user,
      @required this.onSignOut})
      : super(key: key);

  @override
  _yanMenuState createState() => _yanMenuState();
}

class _yanMenuState extends State<yanMenu> with SingleTickerProviderStateMixin {
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
