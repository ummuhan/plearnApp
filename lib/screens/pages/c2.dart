import 'package:flutter/material.dart';
//import 'package:englishapp/utils/levelName.dart';



class c2 extends StatefulWidget {
  @override
  _c2State createState() => _c2State();
}

class _c2State extends State<c2>
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
                  color: Colors.teal.shade200,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
           
          
              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.pink.shade200,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
            
                Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.orange,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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

              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.yellow.shade300,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
               Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.teal.shade200,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
           
          
              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.pink.shade200,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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
            
                Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.orange,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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

              Container(
               width: 400,
               height: 150,
                child: Card(
                  elevation: 40,
                  color: Colors.yellow.shade300,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
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