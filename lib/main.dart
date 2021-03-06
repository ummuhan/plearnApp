import 'package:englishapp/app/landing_page.dart';
import 'package:englishapp/locator.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); //get it kısmından gelmektedir.
  return runApp(MyApps());
} //Projenin çağrıldığı kısım.

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bak mesela bunu ekliyorum
    return ChangeNotifierProvider(
            create: (BuildContext context) => UserModel(),
          child: MaterialApp(
          title: 'Plearn',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            textTheme: Theme.of(context).textTheme.apply(fontFamily: 'yazi'),
          ),
          home: LandingPage(),
        )
        // create: (BuildContext context) => UserModel(),
        );
  }
  // Widget build(BuildContext context) {
  // return MaterialApp(debugShowCheckedModeBanner: false, home: wellcomePage());

}

//Oyun
// return MaterialApp(
// debugShowCheckedModeBanner: false,
// theme: ThemeData.dark().copyWith(
// tooltipTheme: TooltipThemeData(
// decoration: BoxDecoration(
// color: kTooltipColor,
// borderRadius: BorderRadius.circular(5.0),
// ),
// textStyle: TextStyle(
// fontWeight: FontWeight.w900,
// fontSize: 20.0,
// letterSpacing: 1.0,
// color: Colors.white,
// ),
// ),
// scaffoldBackgroundColor: Color(0xFF4225A0),
// textTheme: Theme.of(context).textTheme.apply(fontFamily: 'AmaticSC'),
// ),
// initialRoute: 'HomeScreen',
// routes: {
// 'HomeScreen': (context) => HomeScreen(),
// },
// );
