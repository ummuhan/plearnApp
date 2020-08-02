import 'package:flutter/material.dart';

class EslestirmeOyunu extends StatefulWidget {
  EslestirmeOyunu({Key key}) : super(key: key);

  @override
  _EslestirmeOyunuState createState() => _EslestirmeOyunuState();
}

class _EslestirmeOyunuState extends State<EslestirmeOyunu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.yellow])),
    );
  }
}
