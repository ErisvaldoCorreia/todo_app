import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _todoAppList = ["erisvaldo", "desenvolvedor"];

  Future<File> _saveFile() async {
    String dataTodoAppFlutter = json.encode(_todoAppList);
    final file = await _getFile();
    return file.writeAsString(dataTodoAppFlutter);
  }

  Future<String> _readFile() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (error) {
      return null;
    }
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/@dataTodoAppFlutter.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List Flutter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(17.0, 10.0, 1.0, 1.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Nova Tarefa',
                        labelStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0,
                        )),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.red,
                    size: 30.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 20),
              itemCount: _todoAppList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todoAppList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
