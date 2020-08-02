import 'package:cloud_firestore/cloud_firestore.dart';

class Konusma {
  final String konusma_sahibi;
  final String kimle_konusuyor;
  final bool goruldu;
  final Timestamp olusturulmaTarihi;
  final String son_yollanan_mesaj;
  final Timestamp gorulme_tarihi;
  String konusulanUserName;
  String konusulanUserProfileUrl;

  Konusma(this.konusma_sahibi, this.kimle_konusuyor, this.goruldu,
      this.olusturulmaTarihi, this.son_yollanan_mesaj, this.gorulme_tarihi);

  Map<String, dynamic> toMap() {
    //Mape dönüştürmemizi sağlayan fonksiyondur.
    return {
      'konusma_sahibi': konusma_sahibi,
      'kimle_konusuyor': kimle_konusuyor,
      'goruldu': goruldu,
      'olusturulma_tarihi': olusturulmaTarihi ?? FieldValue.serverTimestamp(),
      'son_yollanan_mesaj': son_yollanan_mesaj ?? FieldValue.serverTimestamp(),
      'gorulme_tarihi': gorulme_tarihi,
    };
  }

  Konusma.fromMap(Map<String, dynamic> map)
      : konusma_sahibi = map['konusma_sahibi'],
        kimle_konusuyor = map['kimle_konusuyor'],
        goruldu = map['goruldu'],
        olusturulmaTarihi = map['olusturulma_tarihi'],
        son_yollanan_mesaj = map['son_yollanan_mesaj'],
        gorulme_tarihi = map['gorulme_tarihi'];
         @override
 String toString() {
   return 'Mesaj{konusma_sahibi: $konusma_sahibi, kimle_konusuyor: $kimle_konusuyor,goruldu: $goruldu, olusturulma_tarihi: $olusturulmaTarihi,  son_yollanan_mesaj: $son_yollanan_mesaj,gorulme_tarihi: $gorulme_tarihi,}';
 }
}
