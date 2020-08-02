import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/model/kelime.dart';
import 'package:englishapp/model/konusma.dart';
import 'package:englishapp/model/mesaj.dart';
import 'package:englishapp/model/success.dart';
import 'package:englishapp/model/user.dart';
import 'database_base.dart';

class FirestoreDBService implements DBBase {
  final Firestore _firebaseDB = Firestore.instance;

  @override
  Future<bool> saveUser(User user) async {
    await _firebaseDB
        .collection("users")
        .document(user.userID)
        .setData(user.toMap());
    DocumentSnapshot _okunanUser =
        await Firestore.instance.document("users/${user.userID}").get();
    Map _okunanUserBilgileriMap = _okunanUser.data;
    User _okunanUserBilgileriNesne = User.fromMap(_okunanUserBilgileriMap);
    print("Okunun user nesnesi" + _okunanUserBilgileriNesne.toString());
    return true;
  }

  @override
  // Future<List<User>> getUserwithPagination(
  // User enSonGetirilenUser, int getirilecekElemanSayisi) async {
  // QuerySnapshot _querySnapshot;
  // List<User> _tumKullanicilar = []; //Kullanıcılar listesini kontrol ettik.
  // if (enSonGetirilenUser == null) {
  // print("İlk kullanıcılar getiriliyor.");
  // _querySnapshot = await Firestore.instance
  // .collection("users")
  // .orderBy("userName")
  // .limit(getirilecekElemanSayisi)
  // .getDocuments();
  // } else {
  // print("Sonraki kullanıcılar getiriliyor");
  // _querySnapshot = await Firestore.instance
  // .collection("users")
  // .orderBy("userName")
  // .startAfter([enSonGetirilenUser.userName])
  // .limit(getirilecekElemanSayisi)
  // .getDocuments();
  // await Future.delayed(Duration(seconds: 2));
  // }
  // for (DocumentSnapshot snap in _querySnapshot.documents) {
  // User _tekUser = User.fromMap(snap.data);
  // _tumKullanicilar.add(_tekUser);
  // print("Getirilen user name " + _tekUser.userName);
  // }
  // return _tumKullanicilar;
  // }

  @override
  Future<User> readUser(String userID) async {
    DocumentSnapshot _okunacakUser =
        await _firebaseDB.collection("users").document(userID).get();
    Map<String, dynamic> _okunanUserNesnesiMap = _okunacakUser.data;
    User _okunacakUserNesnesi = User.fromMap(_okunanUserNesnesiMap);
    print("Okunan user nesnesi:" + _okunacakUserNesnesi.toString());
    return _okunacakUserNesnesi;
  }

  @override
  Future<DateTime> saatiGoster(String userID) {
    return null;
  }

  @override
  Future<bool> updateProfilFoto(String userID, String profilFotoURL) async {
    await _firebaseDB
        .collection("users")
        .document(userID)
        .updateData({'profilURL': profilFotoURL});
    return true;
  }

  @override
  Future<bool> updateUserName(String userID, String yeniUserName) async {
    var users = await _firebaseDB
        .collection("users")
        .where("userName", isEqualTo: yeniUserName)
        .getDocuments();
    if (users.documents.length >= 1) {
      return false;
    } else {
      await _firebaseDB
          .collection("users")
          .document(userID)
          .updateData({'userName': yeniUserName});
      return true;
    }
  }

  @override
  Stream<List<Mesaj>> getMessages(
      String currentUserID, String sohbetEdilenUserID) {
    var snapShot = _firebaseDB
        .collection("konusmalar")
        .document(currentUserID + "--" + sohbetEdilenUserID)
        .collection("mesajlar")
        .orderBy("date", descending: true)
        .snapshots();
    return snapShot.map((mesajListesi) => mesajListesi.documents
        .map((mesaj) => Mesaj.fromMap(mesaj.data))
        .toList());
  }

  Future<bool> saveMessage(Mesaj kaydedilecekMesaj) async {
    var _mesajID = _firebaseDB.collection("konusmalar").document().documentID;
    var _myDocumentID =
        kaydedilecekMesaj.kimden + "--" + kaydedilecekMesaj.kime;
    var _receiverDocumentID =
        kaydedilecekMesaj.kime + "--" + kaydedilecekMesaj.kimden;

    var _kaydedilecekMesajMapYapisi = kaydedilecekMesaj.toMap();

    await _firebaseDB
        .collection("konusmalar")
        .document(_myDocumentID)
        .collection("mesajlar")
        .document(_mesajID)
        .setData(_kaydedilecekMesajMapYapisi);
    await _firebaseDB.collection("konusmalar").document(_myDocumentID).setData({
      "konusma_sahibi": kaydedilecekMesaj.kimden,
      "kimle_konusuyor": kaydedilecekMesaj.kime,
      "son_yollanan_mesaj": kaydedilecekMesaj.mesaj,
      "konusma_goruldu": false,
      "olusturulma_tarihi": FieldValue.serverTimestamp(),
    });

    _kaydedilecekMesajMapYapisi.update("bendenMi", (deger) => false);

    await _firebaseDB
        .collection("konusmalar")
        .document(_receiverDocumentID)
        .collection("mesajlar")
        .document(_mesajID)
        .setData(_kaydedilecekMesajMapYapisi);

    await _firebaseDB
        .collection("konusmalar")
        .document(_receiverDocumentID)
        .setData({
      "konusma_sahibi": kaydedilecekMesaj.kime,
      "kimle_konusuyor": kaydedilecekMesaj.kimden,
      "son_yollanan_mesaj": kaydedilecekMesaj.mesaj,
      "konusma_goruldu": false,
      "olusturulma_tarihi": FieldValue.serverTimestamp(),
    });

    return true;
  }

  @override
  Future<List<Konusma>> getAllConversations(String userID) async {
    QuerySnapshot querySnapshot = await _firebaseDB
        .collection("konusmalar")
        .where("konusma_sahibi", isEqualTo: userID)
        .orderBy("olusturulma_tarihi", descending: true)
        .getDocuments();

    List<Konusma> tumKonusmalar = [];

    for (DocumentSnapshot tekKonusma in querySnapshot.documents) {
      Konusma _tekKonusma = Konusma.fromMap(tekKonusma.data);
      /*print("okunan konusma tarisi:" +
          _tekKonusma.olusturulma_tarihi.toDate().toString());*/
      tumKonusmalar.add(_tekKonusma);
    }

    return tumKonusmalar;
  }

  @override
  Future<List<User>> getAllUser() async {
    QuerySnapshot querySnapshot = await _firebaseDB
        .collection("users")
        .getDocuments(); //Tüm verileri getirmiş oluruz.
    List<User> tumKullanicilar =
        []; //Bu listeye çektiğimiz kullaıcıları gireceğiz.
    for (DocumentSnapshot tekUser in querySnapshot.documents) {
      User _tekUser = User.fromMap(tekUser.data);
      tumKullanicilar.add(_tekUser);
    }

    return tumKullanicilar;
  }

  @override
  Future<Kelime> getKelime() async {
    var rng = new Random();
    int a = rng.nextInt(5);
    DocumentSnapshot _okunacakKelime =
        await _firebaseDB.collection("Sozluk").document('1').get();
    Map<String, dynamic> _okunacakKelimeMap = _okunacakKelime.data;
    Kelime _tekKelime = Kelime.fromMap(_okunacakKelimeMap);
    print("Okunan kelime nesnesi:" + _tekKelime.toString());
    return _tekKelime;
  }

  Kelime _kelimeFromFirebase(DocumentSnapshot kelime) {
    if (kelime == null) return null;
    return Kelime(kelimeID: kelime.documentID);
  }

  Future<bool> saveSuccess(Success kaydedilecekSuccess) async {
    var _kaydedilecekBasariYapisi = kaydedilecekSuccess.toMap();
    await _firebaseDB
        .collection("success")
        .document(kaydedilecekSuccess.userID)
        .collection("Success")
        .document(kaydedilecekSuccess.successID)
        .setData(_kaydedilecekBasariYapisi);
    return true;
  }

  @override
  Future<List<Success>> getMySuccess(String userID) async {
    QuerySnapshot querySnapshot = await _firebaseDB
        .collection("success")
        .document(userID)
        .collection("Success")
        .getDocuments(); //Tüm verileri getirmiş oluruz.
    List<Success> tumBasarilar =
        []; //Bu listeye çektiğimiz kullaıcıları gireceğiz.
    for (DocumentSnapshot tekBasari in querySnapshot.documents) {
      Success _tekBasari = Success.fromMap(tekBasari.data);
      tumBasarilar.add(_tekBasari);
      print(_tekBasari);
    }

    return tumBasarilar;
  }
}
