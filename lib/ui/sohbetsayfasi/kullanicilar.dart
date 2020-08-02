import 'package:englishapp/model/user.dart';
import 'package:englishapp/ui/sohbet.dart';
import 'package:englishapp/ui/sohbetsayfasi/konusmalarim.dart';
import 'package:englishapp/ui/sohbetsayfasi/profilepage.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Kullanicilar extends StatefulWidget {
  @override
  _KullanicilarState createState() => _KullanicilarState();
}

class _KullanicilarState extends State<Kullanicilar>
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

  int secilenMenuItem = 0;

  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    _userModel.getAllUser();
    return Scaffold(
      appBar: AppBar( elevation: 0,
 backgroundColor: Colors.pink[300],
 title: Text("All Users",
     style: TextStyle(
         color: Colors.black,
         fontFamily: 'Quicksand',
         fontWeight: FontWeight.bold,
         fontSize: 30.0)),
 centerTitle: true,),
 body: FutureBuilder<List<User>>(
        future: _userModel.getAllUser(),
        builder: (context, sonuc) {
          if (sonuc.hasData) {
            //Data varsa yapılacak işlemler
            var tumKullanicilar = sonuc.data;
            if (tumKullanicilar.length > 0) {
              return RefreshIndicator(
                onRefresh: _kullanicilarListesimiGuncelle,
         child: ListView.builder(
                  itemCount: tumKullanicilar.length,
                  itemBuilder: (context, index) {
                    var oankiuser = sonuc.data[index];
                    if (oankiuser.userID != _userModel.user.userID) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => Sohbet(
                                currentUser: _userModel.user,
                                SohbetEdilenUser: oankiuser,
                              ),
                            ),
                          );
                        },
               child: ListTile(
                          title: Text(oankiuser.userName),
                          subtitle: Text(oankiuser.email),
                          trailing:
                              Text("Level: " + oankiuser.seviye.toString()),
                          leading: Container(
                            height: 100,
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(oankiuser.profilURL),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: _kullanicilarListesimiGuncelle,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
             child: Container(
            child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.supervised_user_circle,
                            color: Theme.of(context).primaryColor,
                            size: 120,
                          ),
                          Text(
                            "Henüz kullanıcı yok",
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
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var tumKullanicilar = sonuc.data;
        },
      ),
      bottomNavigationBar: battomNavMenu(),
    );
  }

  Future<Null> _kullanicilarListesimiGuncelle() async {
    setState(() {});
    await Future.delayed(Duration(seconds: 1));
    return null;
  }

  battomNavMenu() {
    Theme(
      data: ThemeData(
        primaryColor: Colors.orange,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: Text("Users"),
              backgroundColor: Colors.pink[200]),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text("Messages"),
              backgroundColor: Colors.orange[200]),
          BottomNavigationBarItem(
              icon: Icon(Icons.panorama_fish_eye),
              title: Text(" My Profile"),
              backgroundColor: Colors.green[200]),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: secilenMenuItem,
        onTap: (index) {
          setState(() {
            secilenMenuItem = index;
          });
          if(secilenMenuItem==0){
            return Kullanicilar();
          }
          else if(secilenMenuItem==1){
             return KonusmalarimPage();
          }
          else if(secilenMenuItem==2){
            return ProfilePage();
          }
        
       

        }
      ),
    );
  }
}
