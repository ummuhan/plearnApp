import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String cardText;
  final Color cardColor;
  final Color textColor;
  final double radius;
  final double yukseklik;
  final double genislik;
  final Widget butonIcon;
  final VoidCallback onPressed;

  const CardWidget(
      {Key key,
      this.cardText,
      this.cardColor: Colors.purple,
      this.textColor: Colors.black,
      this.radius: 16,
      this.yukseklik: 100,
      this.genislik: 400,
      this.butonIcon,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: yukseklik,
        width: genislik,
        child: RaisedButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Spreads, Collection-if, Collection-For
              if (butonIcon != null) ...[
                butonIcon,
                Text(
                  cardText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
                Opacity(opacity: 0, child: butonIcon)
              ],
              if (butonIcon == null) ...[
                Container(),
                Text(
                  cardText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
                Container(),
              ]
            ],
          ),
          color: cardColor,
        ),
      ),
    );
  }
}
