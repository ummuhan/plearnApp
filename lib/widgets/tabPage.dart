import 'package:englishapp/model/user.dart';
import 'package:englishapp/ui/sohbetsayfasi/konusmalarim.dart';
import 'package:englishapp/ui/sohbetsayfasi/kullanicilar.dart';
import 'package:englishapp/ui/sohbetsayfasi/profilepage.dart';
import 'package:englishapp/widgets/tab_items.dart';
import 'package:flutter/material.dart';


import 'my_custom_bottom_navi.dart';

class tabPage extends StatefulWidget {
  final User user;

  tabPage({Key key, @required this.user}) : super(key: key);

  @override
  _tabPageState createState() => _tabPageState();
}

class _tabPageState extends State<tabPage> {
  TabItem _currentTab = TabItem.Kullanicilar;

   Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
     TabItem.Kullanicilar: GlobalKey<NavigatorState>(),
     TabItem.Konusmalarim: GlobalKey<NavigatorState>(),
     TabItem.Profil: GlobalKey<NavigatorState>(),
   };

 Map<TabItem, Widget> tumSayfalar() {
 return {
  TabItem.Kullanicilar: Kullanicilar(),
  TabItem.Konusmalarim: KonusmalarimPage(),
  TabItem.Profil: ProfilePage(),
 };
 }

  @override
  Widget build(BuildContext context) {
    return 
     WillPopScope(
       onWillPop: () async =>
         !await navigatorKeys[_currentTab].currentState.maybePop(),
       child: MyCustomBottomNavigation(
        sayfaOlusturucu: tumSayfalar(),
         navigatorKeys: navigatorKeys,
        currentTab: _currentTab,
        onSelectedTab: (secilenTab) {
         if (secilenTab == _currentTab) {
         navigatorKeys[secilenTab]
         .currentState
         .popUntil((route) => route.isFirst);
         } else {
          setState(() {
            _currentTab = secilenTab;
          });
          }
        },
      ),
    );
  }
}
