//Repository ve widget arasında ara bir katman hazırlamamız lazım.
//Bunun için modelleri tanımlamalıyız.
//Gelen veriye göre arayüzümüzü güncellemek isrediğimiz durumlarda kullanırız

import 'package:englishapp/locator.dart';
import 'package:englishapp/model/user_model.dart';
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
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInAnonymously() async {
    try {
      state = ViewState.Busy;
      _user = await _repository.signInAnonymously();
      return _user;
    } catch (e) {
      debugPrint("Viewmodeldeki usermodeldeki signınAnonymously da hata" + e);
      return null;
    } finally {
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
    } catch (e) {
      debugPrint("Viewmodeldeki usermodeldeki signınAnonymously da hata" + e);
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInwithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _repository.signInwithGoogle();
      return _user;
    } catch (e) {
      // debugPrint("Viewmodeldeki usermodeldeki signınAnonymously da hata"+e);
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInFacebook() async {
    try {
      state = ViewState.Busy;
      _user = await _repository.signInFacebook();
      return _user;
    } catch (e) {
      debugPrint("Viewmodeldeki usermodeldeki signınAnonymously da hata" + e);
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> createUserWithEmailandPassword(
      String email, String sifre) async {
    if (_emailSifreKontrol(email, sifre)) {
      try {
        state = ViewState.Busy;
        _user = //Patlıyor
            await _repository.createUserWithEmailandPassword(email, sifre);

        return _user;
      } finally {
        state = ViewState.Idle;
      }
    } else
      return null;
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

  @override
  Future<User> signInWithEmailandPassword(String email, String sifre) async {
    try {
      if (_emailSifreKontrol(email, sifre)) {
        state = ViewState.Busy;
        _user = await _repository.signInWithEmailandPassword(email, sifre);
        return _user;
      } else
        return null;
    } finally {
      state = ViewState.Idle;
    }
  }
}
