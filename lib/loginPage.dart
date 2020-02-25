//import 'package:englishapp/homePage.dart';
//import 'package:englishapp/utils/dataBaseHeper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:englishapp/screens/authenticate/register.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;//Auth nesnesi tanımlamamız gerekmektedir.Firebase kullanmamız için.

  Future<String> signIn(String email, String password) async {
    FirebaseUser user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      print('Error: Giriş işleminde Hata!: $e');
    }
    return user?.uid;
  }
  
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body:Center( child: Container(
        child: Column(
          children: <Widget>[
            Padding(padding:EdgeInsets.all(10)),
            
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Plearn.jpeg'),
                  fit: BoxFit.fill
                )
              ),
           
            ),
     /*      Padding(
              padding: EdgeInsets.all(10.0),
               child: Column(
                 children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.all(10),
                      child: Text("Email and pasword login",style:TextStyle(color: Colors.white),),
                      color: Colors.green.shade900,
                      onPressed:()async{
                        print("User id:"+ await signIn("ummuhanoksuz1@gmail.com", "123123"));// şifre neydi
                        },
                      ),
                 ],
               ),
            ),*/
            Padding(
              padding: EdgeInsets.all(10.0),
               child: Column(
                 children: <Widget>[
                   
                 TextFormField( 
                   decoration: const InputDecoration(icon: Icon(Icons.person),
                   hintText: 'Email',
                   labelText: 'Email',
                   ),onSaved: (String value) {

                   },validator: (String value) {
                     return value.contains('@') ? 'Do not use the @ char.' : null;
                     },),
                 ],
               ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
               child: Column(
                 children: <Widget>[
                   
                 TextFormField( 
                   decoration: const InputDecoration(
                   hintText: 'Pasword',
                   labelText: 'Pasword',
                   icon: const Padding(
                     padding: const EdgeInsets.only(top: 15.0),
                     child: const Icon(Icons.lock),
                     )),
                     validator: (val) => val.length < 6 ? 'Password too short.' : null,
                     //onSaved: {(String value) },//(val) => _password = val,
                    // obscureText: true,
                     ),
                 ],
               ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
               child: Column(
                 children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.all(10),
                      child: Text("Login",style:TextStyle(color: Colors.white),),
                      color: Colors.purple.shade200,
                    onPressed:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => register(),),);
                      
                    },
                   ),
                 ],
               ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
               child: Column(
                 children: <Widget>[
                     Text("Create an account",style:TextStyle(color: Colors.white),),
                     
                   
                 ],
               ),
            ),

            
            
            
          ],
        ),
      ),
      ),
    );
  }
 /* void _emailandpaswordlogin()async{
String mail="ummuhanoksuz1@gmail.com";
String sifre="12345";
var firebaseUser =await _auth.createUserWithEmailAndPassword(email: mail, password: sifre).catchError((e)=>debugPrint("hata"+e.toString()));//Kullanıcı oluşturma

}*/
}

