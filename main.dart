import 'package:flutter/material.dart';
import './page2.dart';
import './splash.dart';

void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash(),
    );
  }
}
class AppHome extends StatefulWidget{
  @override
  State<AppHome> createState() {
    return new AppState();
  }
}

class AppState extends State<AppHome>{
  List<String>  groups = [];

  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: new Text("CET Students"),
        
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("CET Students Manager"),
              subtitle: Text("CET App"),
            ),
           new ListTile(
             leading: Icon(Icons.group),
              title: new Text("Groups"),
            ) ,
            new ListTile(
             leading: Icon(Icons.notifications),
              title: new Text("Notifications"),
            ) , 
            new ListTile(
             leading: Icon(Icons.error_outline),
              title: new Text("About App"),
            ) , 
          ],
        )
      ),
     
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
         backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add),
      ),


     body: groups.isEmpty

        ? Center(child: Text('No Group Yet \n'
         'Please Add Your Groups Now'))
        : ListView(
      children: [
        ...groups.map(
              (name) => Card(
              elevation: 3,
              child: Dismissible(
                background: Container(child: const Icon(Icons.delete),
                color: Colors.red ),
                key: UniqueKey(),
              child: ListTile(
                title: Text(name),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Page1())),
              ))
          ),
        )
      ],
    ),
  );
 }

  void onPressed() {


    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("New Group Name?"),
          content: Container(
            width: 250,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40)),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                suffixIcon: Icon(Icons.group_add),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          actions : <Widget>[
            RaisedButton(
              child: Text("Save"),
              color: Colors.deepPurpleAccent,
              onPressed: () {
                setState(() => groups.add(controller.text));
                controller.clear();
                Navigator.of(context).maybePop();
              },
            ),
            RaisedButton(
              child: Text("Done"),
              color: Colors.deepPurpleAccent,
              onPressed: () {
                controller.clear();
                Navigator.of(context).maybePop();
              },
            )
          ],
        ));


  }

}
class EachList extends StatelessWidget{
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(child: new Text(name[6]),),
            new Padding(padding: EdgeInsets.only(right: 10.0)),
            new Text(name,style: TextStyle(fontSize: 20.0),),

          ],
        ),
      ),
    );
  }

}
class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         leading: Icon(
          Icons.menu,
        ),
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(" GROUP A"),
      ),
      floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
              builder: (context)=>FormScreen()

          )
          
          );

        }

     ),
      body:
      
      
      
       Container(
        child: Center(
          child: Text(
            'No students yet \n'
            'Please add your students now',
            style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

  }
}