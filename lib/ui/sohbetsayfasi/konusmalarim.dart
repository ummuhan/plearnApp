import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/model/konusma.dart';
import 'package:englishapp/model/user.dart';
import 'package:englishapp/ui/sohbet.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KonusmalarimPage extends StatefulWidget {
  @override
  _KonusmalarimPageState createState() => _KonusmalarimPageState();
}

class _KonusmalarimPageState extends State<KonusmalarimPage>
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
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[300],
        title: Text("My Chats",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 30.0)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Konusma>>(
        future: _userModel.getAllConversations(_userModel.user.userID),
        builder: (context, konusmaListesi) {
          if (!konusmaListesi.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var tumKonusmalar = konusmaListesi.data;
            if (tumKonusmalar.length > 0) {
              return RefreshIndicator(
                //Sayfayı kaydırdığımızda gücelleme yapmamızı sağlayacak.
                onRefresh: _kullanicilariminListesiniYenile,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      var oankiKonusma = tumKonusmalar[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => Sohbet(
                                currentUser: _userModel.user,
                                SohbetEdilenUser: User.idveResim(
                                    userID: oankiKonusma.kimle_konusuyor,
                                    profilURL:
                                        oankiKonusma.konusulanUserProfileUrl),
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(oankiKonusma.konusulanUserName),
                          subtitle: Text(oankiKonusma.son_yollanan_mesaj),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  oankiKonusma.konusulanUserProfileUrl)),
                        ),
                      );
                    },
                    itemCount: tumKonusmalar.length),
              );
            } else {
              return RefreshIndicator(
                onRefresh: _kullanicilariminListesiniYenile,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.message,
                            color: Theme.of(context).primaryColor,
                            size: 120,
                          ),
                          Text(
                            "Henüz konuşma yok",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 38),
                          ),
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height - 150,
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }

  void _konusmalarimiGetir() async {
    final _userModel = Provider.of<UserModel>(context);
    var konusmalarim = await Firestore.instance
        .collection("konusmalar")
        .where("konusma_sahibi", isEqualTo: _userModel.user.userID)
        .orderBy("olusturulma_tarihi", descending: true)
        .getDocuments();
    for (var konusma in konusmalarim.documents) {
      print("Konusma:" + konusma.data.toString());
    }
  }

  Future<Null> _kullanicilariminListesiniYenile() async {
    //Geriye değer dönmeyecek ama future olmalı o yuzden null yazarız.

    setState(() {
      return null;
    });
    await Future.delayed(Duration(seconds: 1));
  }
}
