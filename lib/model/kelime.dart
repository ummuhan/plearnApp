import 'package:flutter/material.dart';

class Kelime {
  final String kelimeID;
  String kelime;
  String anlam;
  int seviye;

  Kelime({
    @required this.kelimeID,
    @required this.kelime,
  });
  Map<String, dynamic> toMap() {
    return {
      'kelimeID': kelimeID,
      'kelime': kelime,
      'anlam': anlam,
      'seviye': seviye ?? 1,
    };
  }

  Kelime.fromMap(Map<String, dynamic> map)
      : kelimeID = map['kelimeID'],
        kelime = map['kelime'],
        anlam = map['anlam'],
        seviye = map['seviye'];

  @override
  String toString() {
    return 'Kelime{kelimeID: $kelimeID, kelime: $kelime, anlam: $anlam, seviye: $seviye}';
  }
}
