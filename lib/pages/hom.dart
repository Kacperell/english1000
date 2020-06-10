import 'package:english1000/providers/words_provider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('English 1000 👅'),
          centerTitle: true,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: WordsProvider.getWordsList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final words = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(words[index]['word']),
                        FlatButton(
                            onPressed: () {
                              WordsProvider.insertWord({
                                'word': 'ice',
                                'example_sentence': 'realdy cold',
                                'state': 3,
                              });
                              print(words);
                            },
                            child: Text('ADD')),
                      ],
                    );
                  },
                  itemCount: words.length,
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Add your onPressed code here!
            await WordsProvider.replaceWords();
            setState(() {});
            print("KILL");
          },
          child: Icon(Icons.delete_forever),
          backgroundColor: Colors.green,
        ));
  }
}
