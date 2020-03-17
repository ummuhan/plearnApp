//import 'package:englishapp/homePage.dart';
//import 'package:englishapp/utils/dataBaseHeper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/firestore.dart';
import 'package:englishapp/model/user_model.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'email_password_login_signin.dart';

class wellcomePage extends StatelessWidget {
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
    if (_user != null)
      print("Oturum açan kullanıcı id" + _user.userID.toString());
    else
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
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => _googleGiris(context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            'images/google-logo.png',
                            fit: BoxFit.cover,
                          ),
                          Text("Login with Google",
                              style: TextStyle(color: Colors.black87)),
                          Opacity(
                            opacity: 0,
                            child: Image.asset(
                              'images/google-logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      color: Colors.white,
                    ),
                    RaisedButton(
                        onPressed: () => _facebookGiris(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image.asset(
                              'images/facebook-logo.png',
                              fit: BoxFit.cover,
                            ),
                            Text("Login with Facebook",
                                style: TextStyle(color: Colors.white)),
                            Opacity(
                              opacity: 0,
                              child: Image.asset(
                                'images/facebook-logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        color: Color((0xFF334D92))),
                    RaisedButton(
                      color: Colors.green,
                      onPressed: () => _emailVeSifreGiris(context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.mail,
                            size: 35,
                          ),
                          Text("Use Email and Password",
                              style: TextStyle(color: Colors.white)),
                          Opacity(
                            opacity: 0,
                            child: Icon(Icons.mail),
                          )
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Colors.orange,
                      onPressed: () async {
                        // MyIslem().splitBomba(); // ikiymiş:D
                        try {
                          print("Işlem Başladı");
                          await Firestore.instance
                              .collection("EnglishApp")
                              .document("1")

                              /* await Firestore.instance
                              .collection("EnglishApp")
                              .document("Sozluk")
                              // .collection("Kelimeler")
                              // .document("data")*/
                              .updateData(MyIslem().kalip);
                          print("Başarılı");
                        } catch (e) {
                          print("Hata:" + e.toString());
                        }
                      },
                      /*  onPressed: () => _visitorLogin(
                          context), */ //Bizden bir context beklediği için k-context tanımlamamız gerekiyor.
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.people,
                            size: 35,
                          ),
                          Text("Visitor Login",
                              style: TextStyle(color: Colors.white)),
                          Opacity(
                            opacity: 0,
                            child: Icon(Icons.mail),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
