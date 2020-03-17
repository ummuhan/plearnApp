import 'package:englishapp/screens/game/hangman.dart/components/action_button.dart';
import 'package:englishapp/screens/game/hangman.dart/utilities.dart/hangman_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  final HangmanWords hangmanWords = HangmanWords();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    widget.hangmanWords.readWords();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Text(
                'HANGMAN',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 55.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3.0),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                'images/gallow.png',
                height: height * 0.5,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.07,
          ),
          Center(
            child: Container(
              width: 140,
              height: 70,
              child: ActionButton(
                buttonTitle: 'New Game',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(
                        hangmanObject: widget.hangmanWords,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
