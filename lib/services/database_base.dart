import 'package:englishapp/model/user_model.dart';

abstract class DBBase {
  Future<bool> saveUser(User user);
  Future<User> readUser(String userID);
  Future<bool> updateUserName(String userID, String yeniUserName);
  Future<bool> updateProfilFoto(String userID, String profilFotoURL);
  Future<List<User>> getUserwithPagination(
      User enSonGetirilenUser, int getirilecekElemanSayisi);
  //Future<List<Konusma>> getAllConversations(String userID);
  //Stream<List<Mesaj>> getMessages(String currentUserID, String konusulanUserID);
  //Future<bool> saveMessage(Mesaj kaydedilecekMesaj);
  Future<DateTime> saatiGoster(String userID);
}
