import 'package:englishapp/ui/mysuccess.dart';
import 'package:englishapp/ui/sohbetsayfasi/profilepage.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:englishapp/widgets/common_widget/platform_duyarli_alert.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatefulWidget {
  //final AuthBase authServise;
  final Function onSignOut;
  //final User user;

  const DrawerMenu(
      {Key key,
      // @required this.authServise,
      //this.user,
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
    UserModel _userModel = Provider.of<UserModel>(context);
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .start, //Yukarıdan aşağıya doğru çalışmasını sağlar.
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 75,
                  backgroundImage: NetworkImage(_userModel.user.profilURL),
                )),
            Expanded(
                child: ListView(
              children: <Widget>[
                ListTile(
                    leading: Image.asset('images/helpicons/018-drawing.png'),
                    title: Text(
                      "Your Profile",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.normal,
                          fontSize: 25.0),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    }),
                Divider(
                  height: 14.0,
                  color: Colors.black,
                ),
                ListTile(
                    leading: Image.asset('images/helpicons/040-birthday.png'),
                    title: Text(
                      "Your Success",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.normal,
                          fontSize: 25.0),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MySuccess()));
                    }),
                Divider(
                  height: 14.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Image.asset('images/helpicons/008-idea.png'),
                  title: Text(
                    "Contact us",
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.normal,
                        fontSize: 25.0),
                  ),
                  onTap: () {},
                ),
                Divider(
                  height: 14.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Image.asset('images/helpicons/034-devil.png'),
                  title: Text(
                    "Exit",
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.normal,
                        fontSize: 25.0),
                  ),
                  onTap: () => _cikisIcinOnayIste(context),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Future<bool> _cikisyap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    bool sonuc = await _userModel.signOut();

    return sonuc;
  }

  Future _cikisIcinOnayIste(BuildContext context) async {
    final sonuc = await PlatformDuyarliAlertDialog(
      baslik: 'Emin miziniz?',
      icerik: 'Çıkış yapmak istediğinizden emin misiniz?',
      anaButonYazisi: 'Evet',
      iptalButonYazisi: 'Vazgeç',
      textColor: Colors.white,
    ).goster(context);
    if (sonuc == true) {
      _cikisyap(context);
    }
  }
}
