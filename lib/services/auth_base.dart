import 'package:englishapp/model/user_model.dart';
abstract class AuthBase{
  Future<User> currentUser();//Kullanıcı durumu.
  Future<User> signInAnonymously();//Kullanıcı adı şifre girmeden oturum açan kullanıcı.
  Future<bool> signOut();//Oturum kapatma.
  Future<User> signInwithGoogle();
  Future<User> signInFacebook();
  Future<User> signInWithEmailandPassword(String email, String sifre);
  Future<User> createUserWithEmailandPassword(String email, String sifre);
 // Future<User> signInFacebook();*/
}
//Katmanlar arasında hangisini kullanacağımız işlemini repository kısmında yapacağız.