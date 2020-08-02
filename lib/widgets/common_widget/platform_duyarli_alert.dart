import 'dart:io';
import 'package:englishapp/widgets/common_widget/platform_duyarli_wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDuyarliAlertDialog extends PlatformDuyarliWidget {
  final String baslik;
  final String icerik;
  final String anaButonYazisi;
  final String iptalButonYazisi;
  final Color renk;
  final Color textColor;

  PlatformDuyarliAlertDialog(//İsimlendirilmiş contructor olarak tanımlama yaptık.
      {@required this.baslik,
      @required this.icerik,
      @required this.anaButonYazisi,
      this.textColor,
      this.renk,
      this.iptalButonYazisi});

  Future<bool> goster(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context, builder: (context) => this)
        : await showDialog<bool>(
            context: context,
            builder: (context) => this,
            barrierDismissible: false);
  }

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return Theme(data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.pink[200]),
    child:AlertDialog(contentPadding: EdgeInsets.all(10),
      title: Text(baslik, style: TextStyle(color: textColor),),
      
      content: Text(icerik, style: TextStyle(color: textColor),),
      actions: _dialogButonlariniAyarla(context),
    ),
    );
  }


  List<Widget> _dialogButonlariniAyarla(BuildContext context) {
    final tumButonlar = <Widget>[];

      if (iptalButonYazisi != null) {
        tumButonlar.add(
          FlatButton(
            child: Text(iptalButonYazisi, style: TextStyle(color: textColor),),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        );
      }

      tumButonlar.add(
        FlatButton(
          child: Text("Tamam" ,style: TextStyle(color: textColor),),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      );
    

    return tumButonlar;
  }
}
