
import 'package:englishapp/locator.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/landing_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
 return  runApp(MyApps());
  }//Projenin çağrıldığı kısım.


class MyApps extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    
        return ChangeNotifierProvider(
        child: MaterialApp(
          title: 'Plearn',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: landingPage()), create: (BuildContext context) => UserModel(),
    
    );
    }

}

