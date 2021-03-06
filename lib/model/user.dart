import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

//Arka planda hangi veritabanı kullanılacağı umrumuzda değil verileri user tipinde alacağımızı belirttik.
class User {
  final String userID;
  String email;
  String userName;
  String profilURL;
  DateTime createdAt;
  DateTime updatedAt;
  int seviye;
  int puan;

  User({
    @required this.userID,
    @required this.email,
  });
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'userName': userName ??  email.substring(0,email.indexOf('@')) + randomSayiUret(),
      'profilURL': profilURL ??
          'https://nextgrowthconclave.com/wp-content/uploads/2019/12/no-face.gif',
      'seviye': seviye ?? 1,
      'puan':puan??0,
      'creadteAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  User.fromMap(Map<String, dynamic> map)
       : userID=map['userID'],
        email = map['email'],
        userName = map['userName'],
        profilURL = map['profilURL'],
       // createdAt = (map['createdAt'] as Timestamp).toDate(), // Hatalı
        //updatedAt = (map['updatedAt'] as Timestamp).toDate(), // Hatalı
        seviye = map['seviye'],
        puan=map['puan'];
      
        User.idveResim({ @required this.userID,
 @required this.profilURL,});

  @override
  String toString() {
    return 'User{userID: $userID, email: $email, userName: $userName, profilURL: $profilURL, createdAt: $createdAt, updatedAt: $updatedAt, seviye: $seviye,puan: $puan}';
  }

  String randomSayiUret() {
    int rastgeleSayi = Random().nextInt(999999);
    return rastgeleSayi.toString();
  }
}
