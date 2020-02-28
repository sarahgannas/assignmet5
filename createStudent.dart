import 'package:flutter/material.dart';

class createStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: new Text("Group A"),
         leading: Icon(
          Icons.menu,
        ),
      ),
      body: new Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[ 
              Icon(Icons.account_circle,
              size: 100.0,),
              Text(
                'Sarah Gannas',
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
          new ListTile(
             title: new TextField(
              decoration: new InputDecoration(
                hintText: "Student's ID           152044",),
            ),
          ),
          new ListTile(
             title: new TextField(
              decoration: new InputDecoration(
                hintText: "Age                     21",),
            ),
          ),
          new ListTile(
              title: new TextField(
              decoration: new InputDecoration(
                hintText: "Semister                  6",),
            ),
          ),
        ],
      ),
    );
  }
}