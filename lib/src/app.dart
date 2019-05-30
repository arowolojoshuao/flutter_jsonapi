import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json/src/models/image_model.dart';
import 'package:flutter_json/src/widgets/image_list.dart';
import 'package:http/http.dart' show get;

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: new Text(
          "Fency Day",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () => debugPrint("Icon Tapped")),
          new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () => debugPrint("Search Tapped")),
        ],
      ),
      //Other properties

      backgroundColor: Colors.grey.shade50,


      body: ImageList(images),


      //FAB
      floatingActionButton: new FloatingActionButton(
        onPressed: fetchImage,
        backgroundColor: Colors.green,
        tooltip: 'Going Up!',
        child: new Icon(Icons.call_missed),
      ),

      //BottomNavigationBar
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.add,
                color: Colors.green,
              ),
              title: new Text(
                "Hey",
                style: new TextStyle(color: Colors.green),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.print, color: Colors.green),
              title: new Text(
                "Nope",
                style: new TextStyle(color: Colors.green),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.call_missed, color: Colors.green),
              title: new Text(
                "Hello",
                style: new TextStyle(color: Colors.green),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.search, color: Colors.green),
              title: new Text(
                "Guy",
                style: new TextStyle(color: Colors.green),
              )),
        ],
        onTap: (int i) => debugPrint("Hey Touched $i"),
//  fixedColor: Colors.deepPurple,
      ),
    );
  }
}
