import 'package:englishapp/model/user_model.dart';
import 'package:englishapp/screens/yanMenu.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';




class homePage extends StatelessWidget {
  final User user;
   homePage({Key key,@required this.user, Null Function() onsignOut}) : super(key: key);
    Future<bool> _cikisYap(BuildContext context)async {
                    final _userModel=Provider.of<UserModel>(context,listen: false);
                        bool sonuc=await _userModel.signOut();
                          return sonuc;
                          }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PLEARN",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 40,),),
        actions: <Widget>[
          IconButton(onPressed: (){
          }, 
          icon:Icon(Icons.star),
          tooltip: "Please rate",
          ),
          IconButton(onPressed: (){
            Share.share("Have you downloaded our Plearn mobile app?");//Share kısmı.

          }, 
          icon:Icon(Icons.share),
          tooltip: "Share",
          
          ),
          IconButton(onPressed:()=>_cikisYap(context),//Share kısmı.
                      icon:Icon(Icons.close),
                      tooltip: "Share",
                      
                      ),
                       
                    ],
                    
                  ),
                  body:
                  ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                           width: 400,
                           height: 150,
                            child: Card(
                              elevation: 40,
                              color: Colors.teal.shade200,
                              margin: EdgeInsets.all(10),
                              child: ListTile(
                                onTap: (){
                              /*    Navigator.push(context, MaterialPageRoute(builder: (context)=>a_one(),//Abstract sınıftır direkt olarak route diyerek sayfayı çağıramayız.
                                  ),
                                  );
                                */ 
                                },
                                leading: CircleAvatar(
                                  child:  Icon(Icons.accessibility_new),
                                  radius: 20,
                                  
                                ),
                                title: Text("A1 (Beginner)",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                                subtitle: Text("To begin, begin.",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                                
                              ),
                            ),
                            
                          ),
                          Divider(color: Colors.teal,
                          height: 0,
                          indent: 20,
                          ),
                        ],
            
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                           width: 400,
                           height: 150,
                            child: Card(
                              elevation: 40,
                              color: Colors.pink.shade200,
                              margin: EdgeInsets.all(10),
                              
                              child: ListTile(
                                 onTap: (){
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>a2(),//Abstract sınıftır direkt olarak route diyerek sayfayı çağıramayız.
                               //   ),
                                //  );
                                 
                                },
                                leading: CircleAvatar(
                                  child: Icon(Icons.account_balance),
                                  radius: 20,
                                ),
                                title: Text("A2 (Elementary)",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                                 subtitle: Text("If you can dream it, you can do it.",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                              ),
                            ),
                          ),
                          Divider(color: Colors.teal,
                          height: 0,
                          indent: 20,
                          ),
                        ],
            
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                           width: 400,
                           height: 150,
                            child: Card(
                              elevation: 40,
                              color: Colors.orange,
                              margin: EdgeInsets.all(10),
                              child: ListTile(
                                 onTap: (){
                                /*    Navigator.push(context, MaterialPageRoute(builder: (context)=>b1(),//Abstract sınıftır direkt olarak route diyerek sayfayı çağıramayız.
                                  ),
                                  );
                                 */
                                },
                                leading: CircleAvatar(
                                  child: Icon(Icons.create),
                                  radius: 20,
                                ),
                                title: Text("B1 (Pre-Intermediate)",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                                 subtitle: Text("Only I can change my life. No one can do it for me.",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                              ),
                            ),
                          ),
                          Divider(color: Colors.teal,
                          height: 0,
                          indent: 20,
                          ),
                        ],
            
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                           width: 400,
                           height: 150,
                            child: Card(
                              elevation: 40,
                              color: Colors.yellow.shade300,
                              margin: EdgeInsets.all(10),
                              child: ListTile(
                                 onTap: (){
                                /*     Navigator.push(context, MaterialPageRoute(builder: (context)=>b2(),//Abstract sınıftır direkt olarak route diyerek sayfayı çağıramayız.
                                  ),
                                  );
                                 */
                                },
                                leading: CircleAvatar(
                                  child: Icon(Icons.border_color),
                                  radius: 20,
                                ),
                                title: Text("B2 (Intermediate)",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                                 subtitle: Text("Deserve your dream.",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                              ),
                            ),
                          ),
                          Divider(color: Colors.teal,
                          height: 0,
                          indent: 20,
                          ),
                        ],
            
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                           width: 400,
                           height: 150,
                            child: Card(
                              elevation: 40,
                              color: Colors.green.shade400,
                              margin: EdgeInsets.all(10),
                              child: ListTile(
                                 onTap: (){
                               /*      Navigator.push(context, MaterialPageRoute(builder: (context)=>c1(),//Abstract sınıftır direkt olarak route diyerek sayfayı çağıramayız.
                                  ),
                                  );
                                 */
                                },
                                leading: CircleAvatar(
                                  child: Icon(Icons.book),
                                  radius: 20,
                                ),
                                title: Text("C1 (Upper-Intermediate)",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                                 subtitle: Text("If you don’t like something, change it.",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                              ),
                            ),
                          ),
                          Divider(color: Colors.teal,
                          height: 0,
                          indent: 20,
                          ),
                        ],
            
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                           width: 400,
                           height: 150,
                            child: Card(
                              elevation: 40,
                              color: Colors.blue.shade300,
                              margin: EdgeInsets.all(10),
                              child: ListTile(
                                 onTap: (){
                                 /*    Navigator.push(context, MaterialPageRoute(builder: (context)=>c2(),//Abstract sınıftır direkt olarak route diyerek sayfayı çağıramayız.
                                  ),
                                  );
                                  */
                                 
                                },
                                leading: CircleAvatar(
                                  child: Icon(Icons.account_balance),
                                  radius: 20,
                                ),
                                title: Text("C2 (Advanced)",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                                 subtitle: Text("You must be the change you wish to see in the world.",style: TextStyle(fontFamily: 'Elyazisi',fontSize: 30),),
                              ),
                            ),
                          ),
                          Divider(color: Colors.teal,
                          height: 0,
                          indent: 20,
                          ),
                        ],
            
                      ),
                      
                    ],
                  ),
                  drawer: yanMenu(authServise: null, onSignOut: null,),//Yanda çıkan bilgilendirme ve diğer sekme kısmını açan widget.
            
                );
              }
            
             
   
}