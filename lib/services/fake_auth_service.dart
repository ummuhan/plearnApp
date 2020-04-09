import 'package:englishapp/model/user_model.dart';
import 'package:englishapp/services/auth_base.dart';

//Gerçek bir kullanıcı oturum açıyormuş gibi göstermemizi sağlar.Backand kısmı bitmeden kontrol yapmamızı sağlar.
class FakeAuthenticationService implements AuthBase {
  String userID = "13123243";
  @override
  Future<User> currentUser() async {
    return await Future.value(User(userID: userID, email: null)); //değiştirdim
  }

  @override
  Future<User> signInAnonymously() async {
    return await Future.delayed(
        Duration(seconds: 2), () => User(userID: userID, email: null));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<User> signInwithGoogle() async {
    return await Future.delayed(
        Duration(seconds: 2),
        () =>
            User(userID: "google_user_id_123456", email: "fakeuser@fake.com"));
  }

  @override
  Future<User> signInFacebook() async {
    return await Future.delayed(
        Duration(seconds: 2),
        () => User(
            userID: "facebook_user_id_123456", email: "fakeuser@fake.com"));
  }

  @override
  Future<User> createUserWithEmailandPassword(String email, String sifre) {
    return null;
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String sifre) {
    return null;
  }
}
