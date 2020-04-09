import 'package:flutter/material.dart';

class HomePageCon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Dinamik listeler için listview.builder kulanılır.
      child: ListView.builder(
        itemExtent: 100,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              color: Colors.orangeAccent,
              child: Center(child: Text("Level 1")),
            ),
          );
        },
      ),
    );
  }
}
