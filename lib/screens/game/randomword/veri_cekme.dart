import 'dart:math' show Random;
import 'package:flutter/material.dart';

Random random = new Random();
int randomNumber = random.nextInt(100); // from 0 upto 99 included

class random_uretme extends StatefulWidget {
  @override
  _random_uretmeState createState() => _random_uretmeState();
}

class _random_uretmeState extends State<random_uretme> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
