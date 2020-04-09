import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class RandomWordGenerator {
  final Firestore ref = Firestore.instance;
  Random random = Random();

  int getrandom() {
    int randomNumber = random.nextInt(140); //0-140 arası
    return randomNumber;
  }

  Future<List<Map<String, dynamic>>> fetchWordData(String level) async {
    try {
      List<Map<String, dynamic>> data = [];

      return await ref
          .collection("EnglishApp")
          //.where("seviye", isEqualTo: level) //burada seviye tag ı bulamıyor
          //.limit(1)
          .document('1') // 1-20 arasındaki documenti de random getir
          .get()
          .then((doc) {
        print("Gelen veri : " + doc.data['1'][getrandom()]['anlami']);
        for (int i = 0; i < 20; i++) data.add(doc.data['1'][getrandom()]);
        return data;
      });
    } catch (e) {
      print(e);
      return null;
    }
  }
}
