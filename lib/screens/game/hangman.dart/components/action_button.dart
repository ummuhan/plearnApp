import 'package:englishapp/screens/game/hangman.dart/utilities.dart/constants.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  ActionButton({this.buttonTitle, this.onPress});

  final Function onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2.0,
      color: kActionButtonColor,
      highlightColor: kActionButtonHighlightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPress,
      child: Text(
        buttonTitle,
        style: kActionButtonTextStyle,
      ),
    );
  }
}
