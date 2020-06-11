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
          title: const Text('Most common english words 👅'),
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
              _HomeButton(
                  'Do sprawdzenia', Icons.spellcheck, Colors.blue[800], 0),
              _HomeButton('Zapamiętane', Icons.check_circle_outline,
                  Colors.green[800], 1),
              _HomeButton('Do powtórzenia', Icons.repeat, Colors.red[800], 2),
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
                  var count = await WordsProvider.getCount(_categoryState);
                  print(count);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
            // return Center(child: CircularProgressIndicator());
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
