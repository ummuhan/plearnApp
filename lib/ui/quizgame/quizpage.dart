// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';

// import 'package:englishapp/ui/quizgame/resultpage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class getjson extends StatelessWidget {
//   // accept the langname as a parameter

//   String langname;
//   getjson(this.langname);
//   String assettoload;

//   // a function
//   // sets the asset to a particular JSON file
//   // and opens the JSON
//   setasset() {
//     if (langname == "Python") {
//       assettoload = "assets/python.json";
//     } else if (langname == "Java") {
//       assettoload = "assets/java.json";
//     } else if (langname == "Javascript") {
//       assettoload = "assets/js.json";
//     } else if (langname == "C++") {
//       assettoload = "assets/cpp.json";
//     } else {
//       assettoload = "assets/linux.json";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // this function is called before the build so that
//     // the string assettoload is avialable to the DefaultAssetBuilder
//     setasset();
//     // and now we return the FutureBuilder to load and decode JSON
//     return FutureBuilder(
//       future:
//           DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
//       builder: (context, snapshot) {
//         List mydata = json.decode(snapshot.data.toString());
//         if (mydata == null) {
//           return Scaffold(
//             body: Center(
//               child: Text(
//                 "Loading",
//               ),
//             ),
//           );
//         } else {
//           return quizpage(mydata: mydata);
//         }
//       },
//     );
//   }
// }

// class quizpage extends StatefulWidget {
//   var mydata;

//   quizpage({Key key, @required this.mydata}) : super(key: key);
//   @override
//   _quizpageState createState() => _quizpageState(mydata);
// }

// class _quizpageState extends State<quizpage> {
//   var mydata;
//   _quizpageState(this.mydata);

//   Color colortoshow = Colors.indigoAccent;
//   Color right = Colors.green;
//   Color wrong = Colors.red;
//   int marks = 0;
//   int i = 1;
//   // extra varibale to iterate
//   int j = 1;
//   int timer = 30;
//   String showtimer = "30";
//   var random_array;

//   Map<String, Color> btncolor = {
//     "a": Colors.indigoAccent,
//     "b": Colors.indigoAccent,
//     "c": Colors.indigoAccent,
//     "d": Colors.indigoAccent,
//   };

//   bool canceltimer = false;

//   // code inserted for choosing questions randomly
//   // to create the array elements randomly use the dart:math module
//   // -----     CODE TO GENERATE ARRAY RANDOMLY

//   genrandomarray() {
//     var distinctIds = [];
//     var rand = new Random();
//     for (int i = 0;;) {
//       distinctIds.add(rand.nextInt(10));
//       random_array = distinctIds.toSet().toList();
//       if (random_array.length < 10) {
//         continue;
//       } else {
//         break;
//       }
//     }
//     print(random_array);
//   }

//   @override
//   void initState() {
//     starttimer();
//     genrandomarray();
//     super.initState();
//   }

//   // overriding the setstate function to be called only if mounted
//   @override
//   void setState(fn) {
//     if (mounted) {
//       super.setState(fn);
//     }
//   }

//   void starttimer() async {
//     const onesec = Duration(seconds: 1);
//     Timer.periodic(onesec, (Timer t) {
//       setState(() {
//         if (timer < 1) {
//           t.cancel();
//           nextquestion();
//         } else if (canceltimer == true) {
//           t.cancel();
//         } else {
//           timer = timer - 1;
//         }
//         showtimer = timer.toString();
//       });
//     });
//   }

//   void nextquestion() {
//     canceltimer = false;
//     timer = 30;
//     setState(() {
//       if (j < 10) {
//         i = random_array[j];
//         j++;
//       } else {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => ,
//         ));
//       }
//       btncolor["a"] = Colors.indigoAccent;
//       btncolor["b"] = Colors.indigoAccent;
//       btncolor["c"] = Colors.indigoAccent;
//       btncolor["d"] = Colors.indigoAccent;
//     });
//     starttimer();
//   }

//   void checkanswer(String k) {
//     // in the previous version this was
//     // mydata[2]["1"] == mydata[1]["1"][k]
//     // which i forgot to change
//     // so nake sure that this is now corrected
//     if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
//       // just a print sattement to check the correct working
//       // debugPrint(mydata[2][i.toString()] + " is equal to " + mydata[1][i.toString()][k]);
//       marks = marks + 5;
//       // changing the color variable to be green
//       colortoshow = right;
//     } else {
//       // just a print sattement to check the correct working
//       // debugPrint(mydata[2]["1"] + " is equal to " + mydata[1]["1"][k]);
//       colortoshow = wrong;
//     }
//     setState(() {
//       // applying the changed color to the particular button that was selected
//       btncolor[k] = colortoshow;
//       canceltimer = true;
//     });

//     // changed timer duration to 1 second
//     Timer(Duration(seconds: 1), nextquestion);
//   }

//   Widget choicebutton(String k) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         vertical: 10.0,
//         horizontal: 20.0,
//       ),
//       child: MaterialButton(
//         onPressed: () => null,
//         child: Text(
//           k,
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: "Alike",
//             fontSize: 16.0,
//           ),
//           maxLines: 1,
//         ),
//         color: btncolor[k],
//         splashColor: Colors.indigo[700],
//         highlightColor: Colors.indigo[700],
//         minWidth: 200.0,
//         height: 45.0,
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setPreferredOrientations(
//         // [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
//     // return WillPopScope(
//       // onWillPop: () {
//         // return showDialog(
//             // context: context,
//             // builder: (context) => AlertDialog(
//                   // title: Text(
//                     // "Quizstar",
//                   // ),
//                   // content: Text("You Can't Go Back At This Stage."),
//                   // actions: <Widget>[
//                     // FlatButton(
//                       // onPressed: () {
//                         // Navigator.of(context).pop();
//                       // },
//                       // child: Text(
//                         // 'Ok',
//                       // ),
//                     // )
//                   // ],
//                 // ));
//       // },
//       // child:
//        Scaffold(
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               flex: 3,
//               child: Container(
//                 padding: EdgeInsets.all(15.0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text(
//                   "Kelimenin anlamı nedir?",
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontFamily: "Quando",
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//                 flex: 1,
//               child: Text(
//                 "kelime",
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   fontFamily: "Quando",
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 6,
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     choicebutton('a'),
//                     choicebutton('b'),
//                     choicebutton('c'),
//                     choicebutton('d'),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 alignment: Alignment.topCenter,
//                 child: Center(
//                   child: Text(
//                     showtimer,
//                     style: TextStyle(
//                       fontSize: 35.0,
//                       fontWeight: FontWeight.w700,
//                       fontFamily: 'Times New Roman',
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//     //  ),
//     );
//   }
// }
