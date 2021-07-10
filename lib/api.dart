import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApi extends StatefulWidget {
  const MyApi({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApi> {
  final String url = "https://dry-bayou-99944.herokuapp.com/profiles";
  late List data;
  @override
  void initState() {
    super.initState();
    this.showData();
  }

  Future<String> showData() async {
    var response = await http.get(Uri.parse(url));
    print(response.body);
    showData().whenComplete(() {
      setState(() {
        var JsonData =
            jsonDecode(response.body); 
        data = JsonData;
      });
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("UpCloud App"),
        ),
        body: Column(
         
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                ElevatedButton(onPressed: (){
                  //Navigator.pop(context);
                  //print("Add Data");
                  Navigator.pushNamed(context, '/');
                }, child: Text("Add Data"),
                ),
                
                ElevatedButton(onPressed:() {
                  print("Show data");
                  showData();
                }, child: Text("Show Data"),)
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: FutureBuilder(
                future: showData(),
                builder: (context,snapshot){
                  if (snapshot.data==null){
                    return Container(
                      child: Center(
                        child: Text('Loading...'),
                      ),
                    );
                  }else
                  
                  return ListView.builder(
                    itemCount:  data.length,
                    itemBuilder: (context,i){
                      return Container(
                        child: Center(
                          child: Column(
                            children: [
                              Card(
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                              Text(data[i]['name'] == null
                                  ? "User is not present."
                                  : data[i]['name']),
                              SizedBox(height: 10),
                              Text(data[i]['email'] == null
                                  ? "Email is not present."
                                  : data[i]['email']),
                              SizedBox(height: 10),
                              Text(data[i]['contact'] == null
                                  ? "contact is not present."
                                  :data[i]['contact']),
                              SizedBox(height: 10),
                              Text(data[i]['address'] == null
                                  ? "address is not present."
                                  : data[i]['address']),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

