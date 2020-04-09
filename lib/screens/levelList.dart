import 'package:flutter/material.dart';

class LevelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PLEARN"), //Title kısmı.
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.star),
              tooltip: "Please rate",
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
              tooltip: "Share",
            ),
          ],
        ),
        body: Container() //Appbardan sonra body kısmı çalışacak.

        );
  }
}
