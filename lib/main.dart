import 'package:flutter/material.dart';
import 'package:upcloud_app/api.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/", 
      routes: {
      "/": (context) => MyApp(),
      "/api": (context) => MyApi(),
      },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("UpCloud App"),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  //Navigator.pushNamed(context,'/api' );
                  //print("Add Data");
                }, child: Text("Add Data"),
                ),
                
                ElevatedButton(onPressed:() {
                  Navigator.pushNamed(context,'/api' );
                  
                  //print("Show data");
                }, 
                child: Text("Show Data"),
                )
              ],
            ),
            SizedBox(height: 20,),
            TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name'
              ),
              ),
              SizedBox(height: 10,),
              TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email'
              ),
              ),
              SizedBox(height: 10,),
              TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Contact'
              ),
              ),
              SizedBox(height: 10,),
              TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Address'
              ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Save"),),
          ],
        ),
      ),
    );
  }
}