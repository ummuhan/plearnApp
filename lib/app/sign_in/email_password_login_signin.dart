import 'package:englishapp/app/hata_exception.dart';
import 'package:englishapp/model/user.dart';

import 'package:englishapp/viewmodel/user_model.dart';
import 'package:englishapp/widgets/common_widget/platform_duyarli_alert.dart';
import 'package:englishapp/widgets/common_widget/social_log_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

enum FormType { SignUp, SignIn }

class EmailveSifreLoginPage extends StatefulWidget {
  @override
  _EmailveSifreLoginPageState createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {
  String _email, _sifre;
  String _butonText, _linkText;
  var _formType = FormType.SignIn;
  final _formkey = GlobalKey<FormState>();

  void _formSubmit(BuildContext context) async {
    _formkey.currentState.save();
    debugPrint("Email " + _email + "sifre " + _sifre);
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_formType == FormType.SignIn) {
      try {
        User _girisYapanUser =
            await _userModel.signInWithEmailandPassword(_email, _sifre);
        if (_girisYapanUser != null) {
          print("Giriş yapan user ıd " + _girisYapanUser.userID.toString());
        }
      }on PlatformException catch (e) {
       PlatformDuyarliAlertDialog(
          baslik: "Oturum Açma HATA",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: 'Tamam',
          textColor: Colors.white,
        ).goster(context);
      }
    } else {
      try {
        User _kayitYapanUser =
            await _userModel.createUserWithEmailandPassword(_email, _sifre);
        if (_kayitYapanUser != null) {
          print("Kayıt yapan user ıd " + _kayitYapanUser.userID.toString());
        }
      } on PlatformException catch (e) {
         PlatformDuyarliAlertDialog(
          baslik: "Kullanıcı Oluşturma HATA",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: 'Tamam',
          textColor: Colors.white,
        ).goster(context);
      }
    }
  }

  void degistir() {
    setState(() {
      _formType =
          _formType == FormType.SignIn ? FormType.SignUp : FormType.SignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    _butonText = _formType == FormType.SignIn ? "Sign in" : "Sign up";
    _linkText = _formType == FormType.SignIn
        ? "New to Plearn? Create an account."
        : "Sign in to Plearn.";
    final _userModel = Provider.of<UserModel>(context);
    if (_userModel.user != null) {
      Future.delayed(Duration(milliseconds: 10), () {
        Navigator.of(context).pop();
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp/SignIn"),
        ),
        body: _userModel.state == ViewState.Idle
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          //Canım bu hatayı hepsinde veriyor buralarda hata yok hepsinin ortak kullandığı bir yerde var
                          TextFormField(
                            //Veri alırız
                            initialValue: "emre@emre.com",
                            keyboardType: TextInputType
                                .emailAddress, //email olarak görünmesini sağlarız
                            decoration: InputDecoration(
                              errorText: _userModel.emailHataMesaji != null
                                  ? _userModel.emailHataMesaji
                                  : null,
                              prefixIcon: Icon(Icons.mail),
                              hintText: 'Email', //Yardımcı yazı
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (String girilenEmail) {
                              _email = girilenEmail;
                            },
                          ),
                          SizedBox(
                            height: 8, //Boşluk
                          ),
                          TextFormField(
                              initialValue: "password",
                              obscureText:
                                  true, //Şifrenin gizli olması sağlanır
                              decoration: InputDecoration(
                                errorText: _userModel.sifreHataMesaji != null
                                    ? _userModel.sifreHataMesaji
                                    : null,
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'Password',
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                              onSaved: (String girilenSifre) {
                                _sifre = girilenSifre;
                              }),
                          SizedBox(
                            height: 8, //Boşluk
                          ),
                          SocialLoginButton(
                            butonText: _butonText,
                            butonColor: Theme.of(context).primaryColor,
                            onPressed: () => _formSubmit(context),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          FlatButton(
                              onPressed: () => degistir(),
                              child: Text(_linkText))
                        ],
                      )),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.pink,
                ),
              ));
  }
}
