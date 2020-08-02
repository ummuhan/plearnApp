import 'package:englishapp/model/user.dart';
abstract class AuthBase{

  //Firebase veya başka veritabanıyla ilgisi yoktur.
  Future<User> currentUser();//Kullanıcı durumu.
  Future<User> signInAnonymously();//Kullanıcı adı şifre girmeden oturum açan kullanıcı.
  Future<bool> signOut();//Oturum kapatma.
  Future<User> signInwithGoogle();
  Future<User> signInFacebook();
  Future<User> signInWithEmailandPassword(String email, String sifre);
  Future<User> createUserWithEmailandPassword(String email, String sifre);

}
//Katmanlar arasında hangisini kullanacağımız işlemini repository kısmında yapacağız.