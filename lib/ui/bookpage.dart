import 'package:englishapp/model/books.dart';
import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List<Book> kitaplar;
  @override
  void initState() {
    super.initState();
    final List<String> assetNames = [
      'images/good.png',
      'assets/stefan-stefancik-105587-unsplash.jpg',
      'assets/simon-fitall-530083-unsplash.jpg',
      'assets/anton-repponen-99530-unsplash.jpg',
      'assets/kevin-cochran-524957-unsplash.jpg',
      'assets/samsommer-72299-unsplash.jpg',
      'assets/simon-matzinger-320332-unsplash.jpg',
      'assets/meng-ji-102492-unsplash.jpg',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIBRARY"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          );
        },
      ),
    );
  }
}
