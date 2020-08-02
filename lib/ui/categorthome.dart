import 'package:englishapp/ui/expert.dart';
import 'package:englishapp/ui/intermediate.dart';
import 'package:englishapp/ui/mastery.dart';
import 'package:englishapp/ui/starter.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:englishapp/widgets/common_widget/platform_duyarli_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            'images/globemojies/040-sad.png', 'STARTER', '', '0xFFEC407A', 1),
        _buildPageCard('images/globemojies/027-happy.png', 'INTERMEDIATE', '',
            '0xFF039BE5', 2), //0xFFA5D6A7
        _buildPageCard(
            'images/globemojies/013-happy.png', 'EXPERT', '', '0xFF4DB6AC', 3),
        _buildPageCard(
            'images/globemojies/029-love.png', //0xFFCE93D8
            'MASTERY',
            '',
            '0xFF9C27B0',
            4),
      ],
    );
  }

  Widget _buildPageCard(String imgPath, String name, String aciklama,
      String cardColor, int index) {
    UserModel _userModel = Provider.of<UserModel>(context);
    var oankikullaniciSeviye = _userModel.user.seviye;
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
                onTap: () {
                  if (index == 1) {
                    if (oankikullaniciSeviye == index ||
                        oankikullaniciSeviye > index) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StarterPage()));
                    }else{
                        PlatformDuyarliAlertDialog(baslik: "ERROR", icerik: "You are not at this level yet.", anaButonYazisi: "OKEY").goster(context);
                    }
                  } else if (index == 2) {
                    if (oankikullaniciSeviye == index ||
                        oankikullaniciSeviye > index) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IntermediatePage()));
                    } else {  PlatformDuyarliAlertDialog(baslik: "ERROR", icerik: "You are not at this level yet.", anaButonYazisi: "OKEY").goster(context);}
                  } else if (index == 3) {
                    if (oankikullaniciSeviye == index ||
                        oankikullaniciSeviye > index) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExpertPage()));
                    } else {
                      PlatformDuyarliAlertDialog(baslik: "ERROR", icerik: "You are not at this level yet.", anaButonYazisi: "OKEY").goster(context);
                    }
                  } else if (index == 4) {
                    if (oankikullaniciSeviye == index ||
                        oankikullaniciSeviye > index) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MasteryPage()));
                    } else {  PlatformDuyarliAlertDialog(baslik: "ERROR", icerik: "You are not at this level yet.", anaButonYazisi: "OKEY").goster(context);}
                  }
                },
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
                )),
            SizedBox(height: 40.0),
            Container(
              
              child: Icon(Icons.lock),
            )
          ])),
    );
  }
}
