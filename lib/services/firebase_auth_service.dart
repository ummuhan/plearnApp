import 'package:englishapp/model/user.dart';
import 'package:englishapp/services/auth_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
//Hata çıkması durumu için try catch yapısı kullanmamız gerekmektedir.

class FirebaseAuthService implements AuthBase {
  //Abstract class tanımlandığı için metodları implement etmemiz gerekmektedir.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User> currentUser() async {
    try {
      //Hata yakalama işlemi yaptık.
      FirebaseUser user = await _firebaseAuth.currentUser();
      return _userfromFirebase(
          user); //Bizim frontend kısmımız firebase türünde bir user değil normal bir user nesnesi istediği için onu dönüştürmek için method kullanmamız gerekir.
    } catch (e) {
      print("CURRENT USER" + e.toString());
      return null;
    }
  }

  User _userfromFirebase(FirebaseUser user) {
    if (user == null) {
      return null; //Eğer öyle bir kullanıcı yoksa null döndür.
    } else {
      return User(
          userID: user.uid,
          email: user.email,
         ); //Kullanıcı varsa userId döndür.
    }
  }

  @override
  Future<User> signInAnonymously() async {
    try {
      AuthResult sonuc = await _firebaseAuth.signInAnonymously();
      return _userfromFirebase(sonuc.user);
    } catch (e) {
      print("ERROR ANONYMOUSLY SIGN IN" + e.toString());
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      final _facebookLogin = FacebookLogin();
      await _facebookLogin.logOut();

      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();

      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("sign out hata:" + e.toString());
      return false;
    }
  }

  @override
  Future<User> signInwithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn(); //Ekrana google giriş kısmının gelmesini sağladık
    if (_googleUser != null) {
      //Doğru giriş ile kullanıcının giriş yapmasını sağladık ve verilerini aldık.
      GoogleSignInAuthentication _googleAuth =
          await _googleUser.authentication; //Autentication verilerini aldık.
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        AuthResult sonuc = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        FirebaseUser _user = sonuc.user;
        return _userfromFirebase(_user);
      } else {
        return null;
      }
    } else {
      print("Kullanıcı seçim yapmadı");
      return null;
    }
  }

  @override
  Future<User> signInFacebook() async {
    final _facebookLogin = FacebookLogin();

    FacebookLoginResult _faceResult =
        await _facebookLogin.logIn(['public_profile', 'email']);

    switch (_faceResult.status) {
      case FacebookLoginStatus.loggedIn:
        if (_faceResult.accessToken != null &&
            _faceResult.accessToken.isValid()) {
          AuthResult _firebaseResult = await _firebaseAuth.signInWithCredential(
              FacebookAuthProvider.getCredential(
                  accessToken: _faceResult.accessToken.token));

          FirebaseUser _user = _firebaseResult.user;
          return _userfromFirebase(_user);
        } else {
          /* print("access token valid :" +
              _faceResult.accessToken.isValid().toString());*/
        }

        break;

      case FacebookLoginStatus.cancelledByUser:
        print("kullanıcı facebook girişi iptal etti");
        break;

      case FacebookLoginStatus.error:
        print("Hata cıktı :" + _faceResult.errorMessage);
        break;
    }

    return null;
  }

  @override
  Future<User> createUserWithEmailandPassword(
      String email, String sifre) async {

      AuthResult sonuc = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: sifre);
      return _userfromFirebase(sonuc.user);
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String sifre) async {
      AuthResult sonuc = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: sifre);
      return _userfromFirebase(sonuc.user);
   
   
   
  }

  
}
