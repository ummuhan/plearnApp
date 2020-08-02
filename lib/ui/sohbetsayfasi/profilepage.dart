import 'dart:io';

import 'package:englishapp/viewmodel/user_model.dart';
import 'package:englishapp/widgets/common_widget/platform_duyarli_alert.dart';
import 'package:englishapp/widgets/common_widget/social_log_in_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController
      _controllerUserName; //Username değiştirebilmek için oluştuurldu.
  File _profilFoto;
  @override
  void initState() {
    super.initState();
    _controllerUserName = TextEditingController();
  }

  @override
  void dispose() {
    _controllerUserName.dispose();
    super.dispose();
  }

  void _galeridenResimSec() async {
    var _yeniResim = await ImagePicker.pickImage(
        source: ImageSource.gallery); //Galeri kullanılarak profil resmi ekleriz

    setState(() {
      _profilFoto = _yeniResim;
      Navigator.of(context).pop();
    });
  }

  void _kameradanFotoCek() async {
    var _yeniResim = await ImagePicker.pickImage(
        source: ImageSource.camera); //Kamera kullanılarak profil resmi ekleriz

    setState(() {
      _profilFoto = _yeniResim;
      Navigator.of(context).pop();
    });
  }

  int secilenMenuItem = 0;
  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context);
    _controllerUserName.text = _userModel.user.userName;
    //print("Profil sayfasındaki user degerleri :" + _userModel.user.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[300],
        title: Text("Profile Page",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 30.0)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 160,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.camera),
                                title: Text("Kameradan Çek"),
                                onTap: () {
                                  _kameradanFotoCek();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.image),
                                title: Text("Galeriden Seç"),
                                onTap: () {
                                  _galeridenResimSec();
                                },
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 75,
                  backgroundImage: _profilFoto == null
                      ? NetworkImage(_userModel.user.profilURL)
                      : FileImage(_profilFoto),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: _userModel.user.email,
                readOnly: true, //Sadece okuma yapmamızı sağlar.
                decoration: InputDecoration(
                  hoverColor: Colors.transparent,
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: _userModel.user.seviye.toString(),
                readOnly: true, //Sadece okuma yapmamızı sağlar.
                decoration: InputDecoration(
                  hoverColor: Colors.transparent,
                  labelText: "Your Level",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: _userModel.user.puan.toString(),
                readOnly: true, //Sadece okuma yapmamızı sağlar.
                decoration: InputDecoration(
                  hoverColor: Colors.transparent,
                  labelText: "Your Point",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _controllerUserName,
                decoration: InputDecoration(
                  hoverColor: Colors.transparent,
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SocialLoginButton(
                  butonText: "Save",
                  onPressed: () {
                    _userNameGuncelle(context);
                    _profilFotoGuncelle(context);
                  }),
            ),
          ],
        )),
      ),
    );
  }

  _userNameGuncelle(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_userModel.user.userName != _controllerUserName.text) {
      var updateResult = await _userModel.updateUserName(
          _userModel.user.userID, _controllerUserName.text);

      if (updateResult == true) {
        PlatformDuyarliAlertDialog(
          baslik: "Hata",
          icerik: "Username değiştirildi",
          anaButonYazisi: 'Tamam',
        ).goster(context);
      } else {
        _controllerUserName.text = _userModel.user.userName;
        PlatformDuyarliAlertDialog(
          baslik: "Hata",
          icerik: "Username zaten kullanımda, farklı bir username deneyiniz",
          anaButonYazisi: 'Tamam',
        ).goster(context);
      }
    }
  }

  void _profilFotoGuncelle(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_profilFoto != null) {
      var url = await _userModel.uploadFile(
          _userModel.user.userID, "profil_foto", _profilFoto);
      //print("gelen url :" + url);

      if (url != null) {
        PlatformDuyarliAlertDialog(
          baslik: "Başarılı",
          icerik: "Profil fotoğrafınız güncellendi",
          anaButonYazisi: 'Tamam',
        ).goster(context);
      }
    }
  }
}
