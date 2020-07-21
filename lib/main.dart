import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'GrammarBotModel.dart';

Future<GrammarBotModel> grammarBot(String text) async {
  final http.Response response = await http.post(
    "https://grammarbot.p.rapidapi.com/check",
    headers: <String, String>{
      "x-rapidapi-host": "grammarbot.p.rapidapi.com",
      "x-rapidapi-key": "MY API KEY", //差し替えてあります
    },
    body:
    jsonEncode(<String, String>{
      'language': 'en-US',
      'text': text,
    }),
  );
  print('Response body: ${response.body}');

  if (response.statusCode == 201) {
    return
      GrammarBotModel.fromJson(json.decode(response.body),);
  } else {
    throw Exception('Failed to access GrammarBot.');
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<GrammarBotModel> _checkedSentence;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grammar Check',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grammar check'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_checkedSentence == null)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Enter Title'),
              ),
              RaisedButton(
                child: Text('Check Grammar'),
                onPressed: () {
                  setState(() {
                    _checkedSentence = grammarBot(_controller.text);
                  });
                },
              ),
            ],
          )
              : FutureBuilder<GrammarBotModel>(
            future: _checkedSentence,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.matches.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
