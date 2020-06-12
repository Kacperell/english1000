import 'package:english1000/pages/wordView.dart';
import 'package:english1000/providers/words_provider.dart';
import 'package:flutter/material.dart';

import '../ap_localisations.dart';

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
          title: const Text('Most common English words 👅'),
          automaticallyImplyLeading: false, //hide back button

          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Ustawienia',
              onPressed: () {},
            ),
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // TODO moze tu logo dac?
              _HomeButton(AppLocalizations.of(context).translate('to_check'),
                  Icons.spellcheck, Colors.blue[800], 0),
              _HomeButton(
                  AppLocalizations.of(context).translate('checked_saved'),
                  Icons.check_circle_outline,
                  Colors.green[800],
                  1),
              _HomeButton(AppLocalizations.of(context).translate('to_repeat'),
                  Icons.repeat, Colors.red[800], 2),
            ],
          ),
        ));
  }
}

class _HomeButton extends StatelessWidget {
  final String _text;
  final IconData _icon;
  final Color _color;
  final int _categoryState;
  _HomeButton(this._text, this._icon, this._color, this._categoryState);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 300.0,
      height: 70,
      child: FutureBuilder(
          future: WordsProvider.getCount(_categoryState),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return RaisedButton.icon(
                icon: Icon(
                  _icon,
                ),
                color: _color,
                textColor: Colors.white,
                label: Text(
                  '$_text ${snapshot.data}/1000',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  print(AppLocalizations.of(context).translate('to_check'));
                  print("fsa");

                  var wordQuery =
                      await WordsProvider.getOneWordFromState(_categoryState);
                  if (wordQuery.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Tutaj nie ma Twoich słówek 🤔"),
                            ),
                          );
                        });
                    return;
                  }
                  await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WordView(_color, _categoryState, wordQuery[0])));

                  // await Navigator.pushNamed(context, '/wordView',
                  //     arguments: {
                  //       'colorAppbar': _color,
                  //       'state_of_words': _categoryState,
                  //     });
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

// class _HomeButton extends StatelessWidget {
//   final String _text;
//   final IconData _icon;
//   final Color _color;
//   final int _categoryState;
//   _HomeButton(this._text, this._icon, this._color, this._categoryState);

//   @override
//   Widget build(BuildContext context) {
//     return ButtonTheme(
//       minWidth: 250.0,
//       height: 60,
//       child: RaisedButton.icon(
//         icon: Icon(
//           _icon,
//         ),
//         color: _color,
//         textColor: Colors.white,
//         label: Text(
//           _text,
//           style: TextStyle(fontSize: 20),
//         ),
//         onPressed: () async {
//           var count = await WordsProvider.getCount(_categoryState);
//           print(count);
//         },
//       ),
//     );
//   }
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue[900],
//           title: Text('English 1000 👅'),
//           centerTitle: true,
//           elevation: 0,
//         ),
//         body: FutureBuilder(
//             future: WordsProvider.getWordsList(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 final words = snapshot.data;
//                 return ListView.builder(
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         Text(words[index]['word']),
//                         Text(AppLocalizations.of(context).lng),
//                         FlatButton(
//                             onPressed: () {
//                               WordsProvider.insertWord({
//                                 'word': 'ice',
//                                 'example_sentence': 'realdy cold',
//                                 'state': 3,
//                               });
//                               // print(words);
//                             },
//                             child: Text(AppLocalizations.of(context)
//                                 .translate('first_string'))),
//                       ],
//                     );
//                   },
//                   itemCount: words.length,
//                 );
//               }
//               return Center(child: CircularProgressIndicator());
//             }),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             // Add your onPressed code here!
//             await WordsProvider.replaceWords();
//             setState(() {});
//           },
//           child: Icon(Icons.delete_forever),
//           backgroundColor: Colors.green,
//         ));
//   }
// }
