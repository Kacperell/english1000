import 'package:flutter/material.dart';

class WordView extends StatefulWidget {
  @override
  _WordViewState createState() => _WordViewState();
}

class _WordViewState extends State<WordView> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) print(arguments['exampleArgument']);
    print(arguments);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Most common English words 👅'),
      ),
      body: Text('fs'),
    );
  }
}
