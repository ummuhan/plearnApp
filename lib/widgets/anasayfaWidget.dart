import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _myListView(BuildContext context) {
  final titles = [
    'bike',
    'boat',
    'bus',
  ];

  final icons = [
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
  ];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      // InkWell ile sarmaladık
      return InkWell(
        // InkWell onTap özelliği
        onTap: () => print(titles[index]),
        // InkWell'in özelliklerinden sadece bir tanesi olan splash
        // yani dokununca oluşan dalgalanma rengini değiştirme
        splashColor: Colors.green,
        child: Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(icons[index]),
            title: Text(titles[index]),
          ),
        ),
      );
    },
  );
}
