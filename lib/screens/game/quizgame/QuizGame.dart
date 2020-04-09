import 'package:englishapp/screens/game/quizgame/RandomWordGenerator.dart';
import 'package:flutter/material.dart';

class QuizGame extends StatefulWidget {
  @override
  _QuizGameState createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FutureBuilder(
              future: RandomWordGenerator().fetchWordData("1"),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snap) {
                if (snap.connectionState == ConnectionState.done &&
                    snap.data != null) {
                  return Text("Geldi");
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
