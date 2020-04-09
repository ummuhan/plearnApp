import 'package:englishapp/model/user_model.dart';
import 'package:englishapp/ui/homepage.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:englishapp/widgets/common_widget/social_log_in_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'email_password_login_signin.dart';

class WellcomePage extends StatelessWidget {
  //Bilgi yollamak için callbacklerden faydalanırız.

  void _visitorLogin(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    User _user = await _userModel.signInAnonymously();
    if (_user != null)
      print("Oturum açan kullanıcı id" + _user.userID.toString());
  }

  void _googleGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    User _user = await _userModel.signInwithGoogle();
    if (_user != null) {
      print("Oturum açan kullanıcı id" + _user.userID.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  HomePage(user: _user, onsignOut: null)));
    } else
      print(" _user Null geldi");
  }

  void _facebookGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    User _user = await _userModel.signInFacebook();
    if (_user != null)
      print("Oturum açan kullanıcı id" + _user.userID.toString());
    else
      print(" _user Null geldi");
  }

  void _emailVeSifreGiris(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailveSifreLoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/Plearn.jpeg'),
                        fit: BoxFit.fill)),
              ),
              Text(
                "WELLCOME PLEARN",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              SocialLoginButton(
                butonText: "Gmail ile Giriş Yap",
                textColor: Colors.black87,
                butonColor: Colors.white,
                butonIcon: Image.asset("images/google-logo.png"),
                onPressed: () => _googleGiris(context),
              ),
              SocialLoginButton(
                butonText: "Facebook ile Giriş Yap",
                butonIcon: Image.asset("images/facebook-logo.png"),
                onPressed: () => _facebookGiris(context),
                butonColor: Color(0xFF334D92),
              ),
              SocialLoginButton(
                onPressed: () => _emailVeSifreGiris(context),
                butonIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 32,
                ),
                butonText: "Email ve Şifre ile Giriş yap",
              ),
              SocialLoginButton(
                onPressed: () => _visitorLogin(context),
                butonColor: Colors.teal,
                butonIcon: Icon(Icons.supervised_user_circle),
                butonText: "Misafir Girişi",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
