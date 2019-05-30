import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

void main() async {

  Map _data = await getJson();
  List _features;
  _features = _data['features'];


//  print(_data['features']['title']);

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
                itemCount: _features.length,
                padding: const EdgeInsets.all(14.5)
                , itemBuilder: (BuildContext context, int position) {
              if(position .isOdd) return new Divider();
              final index = position ~/ 2 ;
              var format = new DateFormat.yMMMMd("en_US").add_jm();
              var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['time'] *1000 ,isUtc: true));
//
//              var dateString = format.format(date);
              return new Column(
                children: <Widget>[

                  new Divider(height: 5.5, color: Colors.pink,),
                  new ListTile(
                    title: Text("${_features[index]['properties']['place']}",
                      style: new TextStyle(
                        fontSize: 17.9,
                      ),),
                    subtitle: Text("At: $date",
                      style: new TextStyle(
                        fontSize: 13.9,
                      ),),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.pink.shade300,
                      child: Text("${_features[index]['properties']['mag']}",
                        style: new TextStyle(
                            fontSize: 13.4, color: Colors.white),

                      ),),
                    onTap: () =>
                        _showTapMessage(context, _features[index]['properties']['detail']),
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
    title: Text("Quake"),
    content: Text(msg),
    actions: <Widget>[
      FlatButton(child: Text("OK"), onPressed: () {
        Navigator.pop(context);
      })
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

Future<Map> getJson() async {
  String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
//  String apiUrl = 'https://jsonplaceholder.typicode.com/users';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}




















