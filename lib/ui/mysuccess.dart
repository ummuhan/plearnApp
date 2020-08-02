import 'package:englishapp/model/success.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySuccess extends StatefulWidget {
  @override
  _MySuccessState createState() => _MySuccessState();
}

class _MySuccessState extends State<MySuccess>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  String renk;
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
    _userModel.getMySuccess(_userModel.user.userID);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[300],
        title: Text("My Success",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 30.0)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Success>>(
        future: _userModel.getMySuccess(_userModel.user.userID),
        builder: (context, sonuc) {
          if (sonuc.hasData) {
            var tumBasarilar = sonuc.data;

            if (tumBasarilar.length > 0) {
              return ListView.builder(
                  itemCount: tumBasarilar.length,
                  itemBuilder: (context, index) {
                    String renk = sonuc.data[index].renk;
                    return ListTile(
                      title: Text(
                        "Correct Answer Point " + sonuc.data[index].point.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                      subtitle: Text("Wrong Answer Point  " +
                          sonuc.data[index].wrong.toString()),
                      trailing: Text(
                          "Date: " + sonuc.data[index].createdAt.toString()),
                      leading: Container(
                        height: 100,
                        width: 60,
                        child: CircleAvatar(
                          backgroundColor: Color(int.parse(renk)),
                          radius: 30,
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
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
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<Null> _kullanicilarListesimiGuncelle() async {
    setState(() {});
    await Future.delayed(Duration(seconds: 1));
    return null;
  }
}
