import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class HayvanEslestirme extends StatefulWidget {
  HayvanEslestirme({Key key}) : super(key: key);

  @override
  _HayvanEslestirmeState createState() => _HayvanEslestirmeState();
}

class _HayvanEslestirmeState extends State<HayvanEslestirme> {
  final Map<String, bool> puan = {}; //score

  final Map<String, String> secenek = {
    "🐧": 'Penguin',
    " 🐬": ' Dolphin',
    "🐴": 'Horse',
    "🐈": 'Cat',
    " 🐒": 'Monkey',
    "🐇": 'Rabbit',
  };
  int seed = 0;
  AudioCache _audioController = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            //Tıklandığında veriler karışacak
            backgroundColor: Colors.red,
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                puan.clear();
                seed++;
              });
            }),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.yellow[300], Colors.orange[500]])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: secenek.keys.map((emoji) {
                    return Draggable<String>(
                      data: emoji,
                      child: Emoji(emoji: puan[emoji] == true ? '✔' : emoji),
                      feedback: Emoji(emoji: emoji),
                      childWhenDragging: Emoji(
                          emoji: '⚪'), //Kaydırma işlemi yapılırken kullanılır.
                    );
                  }).toList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: secenek.keys
                      .map((emoji) => _buildDragTarget(emoji))
                      .toList()
                        ..shuffle(Random(seed)),
                )
              ],
            )));
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incomming, List rejected) {
        if (puan[emoji] == true) {
          return Container(
            child: Text(
              "Correct!",
              style: TextStyle(
                fontSize: 25,
                color: Colors.green[700],
                // fontFamily: ('oyun'),
              ),
            ),
            alignment: Alignment.center,
            height: 30,
            width: 100,
          );
        } else {
          return Text(
            secenek[emoji],
            style: TextStyle(color: Colors.black, fontSize: 20),
          );
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          puan[emoji] = true;
        });
        _audioController.play('sound/Success-sound-effect.mp3');
      },
      onLeave: (data) {
        _audioController.play('sound/Deep-error-tone-sound-effect.mp3');
      },
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        padding: EdgeInsets.all(5),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 40),
        ),
      ),
    );
  }
}
