import 'package:flutter/material.dart';
//import 'package:englishapp/utils/levelName.dart';
//import 'package:sqflite/sqflite.dart';


class a_one extends StatefulWidget {
  @override
  _a_oneState createState() => _a_oneState();
}

class _a_oneState extends State<a_one>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
          title: Text("A1 (Beginner)"),
          backgroundColor: Colors.blue.shade200,
         /* flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('images/a1Home.jpg',fit: BoxFit.cover,),
          ),
          */
          expandedHeight: 100,
          floating: false,
          pinned: true,
          centerTitle: true,
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
           
          
              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
            
                Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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

              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
          

              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
            

              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
               Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
           
          
              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
            
                Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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

              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
          

              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.green.shade400,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
            

              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.blue.shade300,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
          )
        ],
      ),
    );
  }
}