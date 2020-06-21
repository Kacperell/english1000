import 'package:english1000/pages/info.dart';
import 'package:english1000/pages/wordView.dart';
import 'package:english1000/providers/words_provider.dart';
import 'package:flutter/material.dart';

class WordList extends StatefulWidget {
  int _state;
  Color _color;
  WordList(state) {
    this._state = state;
    _color = state == 1 ? Colors.green[800] : Colors.red[800];
  }
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoPage(),
          ),
        );

        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: widget._color,
            title: const Text('English1000🎈'),
          ),
          body: FutureBuilder(
              future: WordsProvider.getWordsFromState(widget._state),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final words = snapshot.data;
                  print(words);
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return FlatButton(
                        onPressed: () async {
                          await Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WordView(
                                      widget._color,
                                      widget._state,
                                      words[index],
                                      widget._state)));
                        },
                        child: Column(
                          children: [
                            Divider(
                                // color: Colors.black,
                                ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                words[index]['word'],
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                    itemCount: words.length,
                  );
                }
              })),
    );
  }
}
