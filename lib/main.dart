import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  String _body = "";
  List _data = await getJson();
  for (int i = 0; i < _data.length; i++) {
    print(_data[i]['title']);
    _body = _data[0]['body'];
  }
  runApp(new MaterialApp(
      title: "DEMO",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('JSON PARSER', textAlign: TextAlign.center,
            style: new TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: new Center(
            child: new ListView.builder(
                itemCount: _data.length,
                padding: const EdgeInsets.all(14.5)
                , itemBuilder: (BuildContext context, int position) {
              return new Column(
                children: <Widget>[
                  new Divider(height: 5.5, color: Colors.pink,),
                  new ListTile(
                    title: Text("${_data[position]['title']}",
                      style: new TextStyle(
                        fontSize: 17.9,
                      ),),
                    subtitle: Text("${_data[position]['body']}",
                      style: new TextStyle(
                        fontSize: 13.9,
                      ),),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.pink.shade300,
                      child: Text("${_data[position]['title'][0]}",
                        style: new TextStyle(
                            fontSize: 13.4, color: Colors.white),

                      ),),
                    onTap: () =>
                        _showTapMessage(context, _data[position]['body']),
                  )
                ],
              );
            }
            )
        ),

      )

  ));
}

void _showTapMessage(BuildContext context, String msg) {
  var alert = new AlertDialog(
    title: Text("My App"),
    content: Text(msg),
    actions: <Widget>[
      FlatButton(child: Text("OK"), onPressed: () {
        Navigator.pop(context);
      })
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

Future<List> getJson() async {
//  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  String apiUrl = 'https://jsonplaceholder.typicode.com/users';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}




















