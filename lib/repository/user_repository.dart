import 'dart:io';

import 'package:englishapp/locator.dart';
import 'package:englishapp/model/kelime.dart';
import 'package:englishapp/model/konusma.dart';
import 'package:englishapp/model/mesaj.dart';
import 'package:englishapp/model/success.dart';
import 'package:englishapp/model/user.dart';
import 'package:englishapp/services/auth_base.dart';
import 'package:englishapp/services/fake_auth_service.dart';
import 'package:englishapp/services/firebase_auth_service.dart';
import 'package:englishapp/services/firebase_storage_service.dart';
import 'package:englishapp/services/firestore_db_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _authenticationService =
      locator<FakeAuthenticationService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();
  FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();

  /*     BildirimGondermeServis _bildirimGondermeServis =
      locator<BildirimGondermeServis>();*/

  AppMode appMode = AppMode.RELEASE;
  List<User> tumKullanicilarListesi = [];
  Map<String, String> kullaniciToken = Map<String, String>();

  @override
  Future<User> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _authenticationService.currentUser();
    } else {
      User _user = await _firebaseAuthService.currentUser();
      if (_user != null)
        return await _firestoreDBService.readUser(_user.userID);
      else
        return null;
    }
  }

  @override
  Future<User> signInAnonymously() async {
    if (appMode == AppMode.DEBUG) {
      return await _authenticationService.signInAnonymously();
    } else {
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _authenticationService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<User> signInwithGoogle() async {
    if (appMode == AppMode.DEBUG) {
      return await _authenticationService.signInwithGoogle();
    } else {
      User _user = await _firebaseAuthService.signInwithGoogle();
      if (_user != null) {
        bool _sonuc = await _firestoreDBService.saveUser(_user);
        if (_sonuc) {
          return await _firestoreDBService.readUser(_user.userID);
        } else {
          return null;
        }
      } else
        return null;
    }
  }

  @override
  Future<User> signInFacebook() async {
    if (appMode == AppMode.DEBUG) {
      return await _authenticationService.signInFacebook();
    } else {
      User _user = await _firebaseAuthService.signInFacebook();
      bool _sonuc = await _firestoreDBService.saveUser(_user);
      if (_sonuc) {
        return (_user);
      } else {
        return null;
      }
    }
  }

  @override
  Future<User> createUserWithEmailandPassword(
      String email, String sifre) async {
    if (appMode == AppMode.DEBUG) {
      return await _authenticationService.createUserWithEmailandPassword(
          email, sifre);
    } else {
      User _user = await _firebaseAuthService.createUserWithEmailandPassword(
          email, sifre);
      bool _sonuc = await _firestoreDBService.saveUser(_user);
      if (_sonuc) {
        return await _firestoreDBService.readUser(_user.userID);
      } else
        return null;
    }
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String sifre) async {
    if (appMode == AppMode.DEBUG) {
      return await _authenticationService.signInWithEmailandPassword(
          email, sifre);
    } else {
      User _user =
          await _firebaseAuthService.signInWithEmailandPassword(email, sifre);

      return await _firestoreDBService.readUser(_user.userID);
    }
  }

  updateUserName(String userID, String yeniUserName) async {
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {
      return await _firestoreDBService.updateUserName(userID, yeniUserName);
    }
  }

  Future<String> uploadFile(
      String userID, String fileType, File profilFoto) async {
    if (appMode == AppMode.DEBUG) {
      return "dosya_indirme_linki";
    } else {
      var profilFotoURL = await _firebaseStorageService.uploadFile(
          userID, fileType, profilFoto);
      await _firestoreDBService.updateProfilFoto(userID, profilFotoURL);
      return profilFotoURL;
    }
  }

  Stream<List<Mesaj>> getMessages(
      String currentUserID, String sohbetedilenUserID) {
    if (appMode == AppMode.DEBUG) {
      return Stream.empty();
    } else {
      return _firestoreDBService.getMessages(currentUserID, sohbetedilenUserID);
    }
  }

  Future<bool> saveMessage(Mesaj kaydedilecekMesaj) async {
    if (appMode == AppMode.DEBUG) {
      return true;
    } else {
      return _firestoreDBService.saveMessage(kaydedilecekMesaj);
    }
  }

  Future<List<Konusma>> getAllConversations(String userID) async {
    if (appMode == AppMode.DEBUG) {
      return [];
    } else {
      var konusmaListesi =
          await _firestoreDBService.getAllConversations(userID);
      for (var oankiKonusma in konusmaListesi) {
        var userListesindekiKullanici =
            listedeUserBul(oankiKonusma.kimle_konusuyor);
        if (userListesindekiKullanici != null) {
          oankiKonusma.konusulanUserName = userListesindekiKullanici.userName;
          oankiKonusma.konusulanUserProfileUrl =
              userListesindekiKullanici.profilURL;
        } else {
          print("Aranan user daha önce veritabanından getirilmemiş.");
          var _veritabanindanOkunanUser =
              await _firestoreDBService.readUser(oankiKonusma.kimle_konusuyor);
          oankiKonusma.konusulanUserName = _veritabanindanOkunanUser.userName;
          oankiKonusma.konusulanUserProfileUrl =
              _veritabanindanOkunanUser.profilURL;
        }
      }
      return konusmaListesi;
    }
  }

  User listedeUserBul(String userID) {
    for (int i = 0; i < tumKullanicilarListesi.length - 1; i++) {
      //Kullanıcı profili ve fotoğrafı için kullandık tekrar internete çıkmak yerine önceden getirdiğimiz listeden elemanları aramamızı sağlıyor.
      if (tumKullanicilarListesi[i].userID == userID) {
        return tumKullanicilarListesi[i];
      } else {
        return null;
      }
    }
  }

  getAllUser() async {
    if (appMode == AppMode.DEBUG) {
      return [];
    } else {
      var tumKullanicilarListesi = await _firestoreDBService.getAllUser();
      return _firestoreDBService.getAllUser();
    }
  }

  Future<Kelime> getKelime() async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      return _firestoreDBService.getKelime();
    }
  }

  Future<bool> saveSuccess(Success kaydedilecekSuccess)async {
      if (appMode == AppMode.DEBUG) {
      return true;
    } else {
      return _firestoreDBService.saveSuccess(kaydedilecekSuccess);
    }
  }

  Future<List<Success>> getMySuccess(String userID) async{
      if (appMode == AppMode.DEBUG) {
      return [];
    } else {
      var tumKullanicilarListesi = await _firestoreDBService.getAllUser();
      return _firestoreDBService.getMySuccess(userID);
    }
  }
}
