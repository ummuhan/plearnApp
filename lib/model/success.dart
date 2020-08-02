import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

//Arka planda hangi veritabanı kullanılacağı umrumuzda değil verileri user tipinde alacağımızı belirttik.
class Success {
  final String userID;
  final String successID;
  final int point;
  final int wrong;
  final DateTime createdAt;
  final String renk;

  Success(
     {this.successID,
    this.wrong,
    this.createdAt,
    this.renk,
    this.userID,
    this.point,
  });
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'successID': successID,
      'point': point,
      'renk': renk,
      'wrong': wrong,
      'creadteAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }

  Success.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        successID = map['successID'],
        point = map['point'],
        renk = map['renk'],
        createdAt =  map['date'], // Hatalı
        //updatedAt = (map['updatedAt'] as Timestamp).toDate(), // Hatalı
        wrong = map['wrong'];

  @override
  String toString() {
    return 'User{userID: $userID,successID: $successID,  point: $point, wrong: $wrong,renk: $renk, createdAt: $createdAt}';
  }

  String randomSayiUret() {
    int rastgeleSayi = Random().nextInt(999999);
    return rastgeleSayi.toString();
  }
}
