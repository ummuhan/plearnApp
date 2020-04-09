import 'package:englishapp/locator.dart';
import 'package:englishapp/model/user_model.dart';
import 'package:englishapp/services/auth_base.dart';
import 'package:englishapp/services/fake_auth_service.dart';
import 'package:englishapp/services/firebase_auth_service.dart';
import 'package:englishapp/services/firestore_db_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _authenticationService =
      locator<FakeAuthenticationService>();
  var _firestoreDBService = locator<FirestoreDBService>();
  /*FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();
     
       BildirimGondermeServis _bildirimGondermeServis =
      locator<BildirimGondermeServis>();*/

  AppMode appMode = AppMode.RELEASE;
  /* List<User> tumKullaniciListesi = [];*/
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
          await _firebaseAuthService.signOut();
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
      return await _firebaseAuthService.signInFacebook();
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
      //Burda patlıyor
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

  Future<bool> updateUserName(String userID, String yeniUserName) async {
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {
      return await _firestoreDBService.updateUserName(userID, yeniUserName);
    }
  }
}
