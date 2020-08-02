import 'package:englishapp/model/kelime.dart';
import 'package:englishapp/model/konusma.dart';
import 'package:englishapp/model/mesaj.dart';
import 'package:englishapp/model/success.dart';
import 'package:englishapp/model/user.dart';

abstract class DBBase {
  Future<bool> saveUser(
      User user); //Kullanıcı kaydedildiyse boolean değer döndürerek gösterir.
  Future<User> readUser(
      String
          userID); //Kullanıcıyı okuyarak sayfalarda işlem yapmamızı sağlamaktadır.
  Future<bool> updateUserName(String userID, String yeniUserName);
  Future<bool> updateProfilFoto(String userID, String profilFotoURL);
  Future<List<User>> getAllUser();
  Future<List<Konusma>> getAllConversations(String userID);
  Stream<List<Mesaj>> getMessages(String currentUserID, String konusulanUserID);
  Future<bool> saveMessage(Mesaj kaydedilecekMesaj);
  Future<DateTime> saatiGoster(String userID);
  Future<Kelime>getKelime();
  Future<bool> saveSuccess(Success kaydedilecekSuccess);
   Future<List<Success>> getMySuccess(String UserID);


 
 
}
