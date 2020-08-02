//Repository ve widget arasında ara bir katman hazırlamamız lazım.
//Bunun için modelleri tanımlamalıyız.
//Gelen veriye göre arayüzümüzü güncellemek isrediğimiz durumlarda kullanırız

import 'dart:io';

import 'package:englishapp/locator.dart';
import 'package:englishapp/model/kelime.dart';
import 'package:englishapp/model/konusma.dart';
import 'package:englishapp/model/mesaj.dart';
import 'package:englishapp/model/success.dart';
import 'package:englishapp/model/user.dart';
import 'package:englishapp/repository/user_repository.dart';
import 'package:englishapp/services/auth_base.dart';
import 'package:flutter/cupertino.dart';

enum ViewState { Idle, Busy } //Boşta veya meşgul olabilir.

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  var _repository = locator<UserRepository>();
  User _user;

  User get user =>
      _user; //Userı projede herhangi bir yerde çağırabilmek için getter tanımlamamız gerekir.
  ViewState get state => _state;
  String emailHataMesaji;
  String sifreHataMesaji;

  set state(ViewState value) {
    _state = value;
    notifyListeners(); //Değişimde arayüze bilgi vermeyi sağlar.
  }

  UserModel() {
    currentUser();
  }
  

  @override
  Future<User> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _repository.currentUser();
      return _user;
    } catch (e) {
      return null;
    } finally {
      state = ViewState
          .Idle; 
    }
  }

  @override
  Future<User> signInAnonymously() async {
    try {
      state = ViewState.Busy;
      _user = await _repository.signInAnonymously();
      return _user;
    }  finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      bool sonuc = await _repository.signOut();
      _user = null;
      return sonuc;
    } 
       finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInwithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _repository.signInwithGoogle();
      return _user;
    } 
      
      
  finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInFacebook() async {
   try{
      state = ViewState.Busy;
      _user = await _repository.signInFacebook();
      return _user;
    }finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> createUserWithEmailandPassword(
      String email, String sifre) async {
    if (_emailSifreKontrol(email, sifre)) {
      try {
        state = ViewState.Busy;
        _user = await _repository.createUserWithEmailandPassword(email, sifre);
      return _user;
      } finally {
        state = ViewState.Idle;
      }

  
    } else
      return null;
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String sifre) async {
    try {
      if (_emailSifreKontrol(email, sifre)) {
        state = ViewState.Busy;
        _user = await _repository.signInWithEmailandPassword(email, sifre);
        return _user;
      } else
        return null;
    }  finally {
      state = ViewState.Idle;
    }
  }


Future<List<User>> getAllUser()async{
  var tumKullaniciListesi=await _repository.getAllUser();
  return tumKullaniciListesi;
}
  bool _emailSifreKontrol(String email, String sifre) {
    var sonuc = true;

    if (sifre.length < 6) {
      sifreHataMesaji = "En az 6 karakter olmalı";
      sonuc = false;
    } else
      sifreHataMesaji = null;
    if (!email.contains('@')) {
      emailHataMesaji = "Geçersiz email adresi";
      sonuc = false;
    } else
      emailHataMesaji = null;
    return sonuc;
  }
 Future<bool> updateUserName(String userID, String yeniUserName) async {
    var sonuc = await _repository.updateUserName(userID, yeniUserName);
    if (sonuc) {
      _user.userName = yeniUserName;
    }
    return sonuc;
  }

 

Future<String> uploadFile(String userID, String fileType, File profilFoto) async {
    var indirmeLinki =
        await _repository.uploadFile(userID, fileType, profilFoto);
    return indirmeLinki;
  }

  Stream<List<Mesaj>> getMessages(String currentUserID, String sohbetedilenUserID) {
   return _repository.getMessages(currentUserID,sohbetedilenUserID);
  }

  Future<bool> saveMessage(Mesaj kaydedilecekMesaj)async {
    return await _repository.saveMessage(kaydedilecekMesaj);
  }

  Future<List<Konusma>> getAllConversations(String userID) async{
     return await _repository.getAllConversations(userID);
  }
  Future<Kelime> getKelime()async{
 var kelime= await _repository.getKelime();
 return kelime;
  }

  Future<bool> saveSuccess(Success kaydedilecekSuccess) {
    return _repository.saveSuccess(kaydedilecekSuccess);
  }

  Future<List<Success>> getMySuccess(String userID) async {
    return await _repository.getMySuccess(userID);
  }
 
}
