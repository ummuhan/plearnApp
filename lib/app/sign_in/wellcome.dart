import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/model/user.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:englishapp/widgets/common_widget/social_log_in_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'email_password_login_signin.dart';

class WellcomePage extends StatelessWidget {
  //Bilgi yollamak için callbacklerden faydalanırız.
  final Firestore _firestore = Firestore.instance;

  void _visitorLogin(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    User _user = await _userModel.signInAnonymously();
    if (_user != null)
      print("Oturum açan kullanıcı id" + _user.userID.toString());
    else {
      print(" _user Null geldi");
    } // HomePage(user: _user, onsignOut: null)));
  }

  void _googleGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    User _user = await _userModel.signInwithGoogle();
    if (_user != null) {
      //hayatım
      print("Oturum açan kullanıcı id" + _user.userID.toString());
    } else
      print(" _user Null geldi");
  }

  void _facebookGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context,
        listen: false); // debug moddaymışeıfjazjfdjfsbkdfjshkdfjh
    User _user = await _userModel.signInFacebook();
    if (_user != null) {
      print("Oturum açan kullanıcı id" + _user.userID.toString());
    } else
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

//geri dön girişe basmıcaktım
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
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
              SizedBox(
                height: 25,
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
              //   
            ],
          ),
        ),
      ),
    );
  }

  veriEkle() {
    String a = "100";
    _firestore.collection("Sozluk").document(a).setData(
      {"kelime": "abo", "anlam": "yerli", "seviye": "1", "kelimeID": a},
    );
  }
}
