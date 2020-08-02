import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/model/mesaj.dart';
import 'package:englishapp/model/user.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Sohbet extends StatefulWidget {
  final User currentUser;
  final User SohbetEdilenUser;

  Sohbet({this.currentUser, this.SohbetEdilenUser});
  @override
  _SohbetState createState() => _SohbetState();
}

class _SohbetState extends State<Sohbet> {
  int secilenMenuItem = 0;
  var _mesajController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  
  @override
  Widget build(BuildContext context) {
    User _currenUser = widget.currentUser;
    User _SohbetEdilenUser = widget.SohbetEdilenUser;

    UserModel _userModel = Provider.of<UserModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: Text(_SohbetEdilenUser.userName, 
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 30.0)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<List<Mesaj>>(
                stream: _userModel.getMessages(
                    _currenUser.userID, _SohbetEdilenUser.userID),
                builder: (context, streamMesalarListesi) {
                  if (!streamMesalarListesi.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var tumMesajlar = streamMesalarListesi.data;
                  return ListView.builder(
                      controller: _scrollController,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return _konusmaBalonuOlustu(tumMesajlar[index]);
                      },
                      itemCount: tumMesajlar.length);
                },
              ),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 8, left: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _mesajController,
                        cursorColor: Colors.blueGrey,
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.black),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Mesajınızı yazınız.",
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.orange,
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          if (_mesajController.text.trim().length > 0) {
                            //Kullanıcının boş mesaj yollamasını engeller.
                            Mesaj _kaydedilecekMesaj = Mesaj(
                              kimden: _currenUser.userID,
                              kime: _SohbetEdilenUser.userID,
                              bendenMi: true,
                              mesaj: _mesajController.text,
                            );
                            var sonuc = await _userModel
                                .saveMessage(_kaydedilecekMesaj);
                            if (sonuc) {
                              _mesajController.clear();
                              _scrollController.animateTo(0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 10));
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _konusmaBalonuOlustu(Mesaj oankiMesaj) {
    Color _gelenMesajRenk = Colors.purple[200];
    Color _gidenMesajRenk = Colors.orange[200];
    var _saatdakikaDegeri = "";
    try {
      _saatdakikaDegeri = _saatdakikagoster(oankiMesaj.date);
    } catch (e) {
      print("Hata var" + e);
    }

    var _benimMesaimMi = oankiMesaj.bendenMi;
    if (_benimMesaimMi) {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: _gidenMesajRenk),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(4),
                    child: Text(
                      oankiMesaj.mesaj,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Text(
                  _saatdakikaDegeri,
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.SohbetEdilenUser.profilURL),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: _gelenMesajRenk),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(4),
                    child: Text(
                      oankiMesaj.mesaj,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Text(
                  _saatdakikaDegeri,
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      );
    }
  }

  String _saatdakikagoster(Timestamp date) {
    var _formatter = DateFormat.Hm();
    var _formatlanisTarih = _formatter.format(date.toDate());
    return _formatlanisTarih;
  }
}
