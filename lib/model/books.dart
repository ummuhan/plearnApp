class Book {
  int id;
  String _isim;
  String _aciklama;
  String _resim;
  Book(this.id, this._isim, this._aciklama, this._resim);

  String get isim => _isim;

  set isim(String value) {
    _isim = value;
  }

  String get aciklama => _aciklama;

  // ignore: unnecessary_getters_setters
  set aciklama(String value) {
    _aciklama = value;
  }

  String get resim => _resim;

  set resim(String value) {
    _resim = value;
  }
}

final List<Book> kitaplar = [
  Book(9, "General Knowledge", "fdwefer", "images/2.png"),
  Book(10, "General Knowledge", "fdwefer", "images/2.png"),
  Book(11, "General Knowledge", "fdwefer", "images/2.png"),
  Book(12, "General Knowledge", "fdwefer", "images/2.png"),
  Book(13, "General Knowledge", "fdwefer", "images/2.png"),
  Book(14, "General Knowledge", "fdwefer", "images/2.png"),
  Book(15, "General Knowledge", "fdwefer", "images/2.png"),
  Book(16, "General Knowledge", "fdwefer", "images/2.png"),
  Book(17, "General Knowledge", "fdwefer", "images/2.png"),
  Book(18, "General Knowledge", "fdwefer", "images/2.png"),
  Book(19, "General Knowledge", "fdwefer", "images/2.png"),
  Book(20, "General Knowledge", "fdwefer", "images/2.png"),
  Book(21, "General Knowledge", "fdwefer", "images/2.png"),
];
