import 'dart:ui';

import 'package:english1000/providers/words_provider.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

import '../ap_localisations.dart';

class WordView extends StatefulWidget {
  final Color appBarColor;
  final int category_of_state;
  var wordQuery;
  WordView(this.appBarColor, this.category_of_state, this.wordQuery);

  @override
  _WordViewState createState() => _WordViewState();
}

class _WordViewState extends State<WordView> {
  double blur = 7.0; //7 blur,0 none
  @override
  Widget build(BuildContext context) {
    // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacementNamed(
          context,
          '/',
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          backgroundColor: widget.appBarColor,
          title: const Text('Most common English words 👅'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                IconButton(
                    icon: Icon(Icons.volume_up),
                    onPressed: () {
                      final player = AudioCache();
                      // call this method when desired
                      player.play('mp3/${widget.wordQuery['word']}.mp3');
                    }),
                Text(
                  widget.wordQuery['word'],
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.volume_up),
                        onPressed: () {
                          final player = AudioCache();
                          player.play(
                              'mp3/${widget.wordQuery['word']}_sentence.mp3');
                        }),
                    Text(
                      AppLocalizations.of(context).translate('example'),
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.wordQuery['example_sentence'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Stack(
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.wordQuery['pl_translate'],
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(height: 10),
                            Text(widget.wordQuery['pl_example'],
                                style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                      height: 80.0,
                    ),
                    Center(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: blur,
                            sigmaY: blur,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 400.0,
                            height: 80.0,
                            color: Colors.black.withOpacity(0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ButtonTheme(
                  height: 50,
                  child: RaisedButton.icon(
                      color: Colors.yellow[900],
                      onPressed: () {
                        setState(() {
                          if (blur == 0) {
                            blur = 7;
                          } else {
                            blur = 0;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.lock_open,
                        color: Colors.white,
                      ),
                      label: Text(
                        AppLocalizations.of(context).translate('see_translete'),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    KnowOrNotButton(
                        AppLocalizations.of(context).translate('know'),
                        Icons.check_circle_outline,
                        Colors.green[800],
                        widget.wordQuery['id'],
                        widget.wordQuery['state'],
                        1,
                        widget.appBarColor),
                    KnowOrNotButton(
                        AppLocalizations.of(context).translate('not_know'),
                        Icons.repeat,
                        Colors.red[800],
                        widget.wordQuery['id'],
                        widget.wordQuery['state'],
                        2,
                        widget.appBarColor),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KnowOrNotButton extends StatelessWidget {
  final String _btnText;
  final IconData _icon;
  final Color _color;
  final Color _appBarColorToNextWord;
  final int _word_id;
  final int _categoryState;
  final int _to_categoryState;
  // final int _categoryState;
  KnowOrNotButton(this._btnText, this._icon, this._color, this._word_id,
      this._categoryState, this._to_categoryState, this._appBarColorToNextWord);

  void emptyshowDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text(AppLocalizations.of(context).translate('no_more_words')),
            ),
          );
        });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ButtonTheme(
          height: 60,
          child: RaisedButton.icon(
              onPressed: () async {
                await WordsProvider.updateWord(_to_categoryState, _word_id);
                var wordQuery =
                    await WordsProvider.getOneWordFromState(_categoryState);

                print("-1-");
                print(wordQuery);
                print("-1-");

                //   int found=0;// if yeas 1
                // while(found==0){
                // }

                if (wordQuery.isEmpty) {
                  emptyshowDialog(context);
                  return;
                }

                // hmm ☠ musze brac id id ++az znajdzie
                //moze for?
                if (_word_id == wordQuery[0]['id']) {
                  print("znowu?");
                  //bierzemy drugie slowo
                  wordQuery = await WordsProvider.getOneSecondWordFromState(
                      _categoryState);
                }

                if (wordQuery.isEmpty) {
                  emptyshowDialog(context);
                  return;
                }
                // TODO jesli sie zmienai slwowno np w znanych dma ze znam to wraca to samo
                //sprawdzic czy _word_id == wordQuery[0]['id'] jesl itak to
                //to spradzyc czy sinitej word query[1] jesli tak to idzemy do neigo
                print("-2-");
                print(wordQuery);
                print("-2-");

                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WordView(_appBarColorToNextWord,
                            _categoryState, wordQuery[0])));
              },
              color: _color,
              icon: Icon(
                _icon,
                color: Colors.white,
              ),
              label: Text(
                _btnText,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ),
      ),
    );
  }
}
// class KnowOrNotButton extends StatelessWidget {
//   final String _btnText;
//   final IconData _icon;
//   final Color _color;
//   // final int _categoryState;
//   KnowOrNotButton(this._btnText, this._icon, this._color);

//   @override
//   Widget build(BuildContext context) {
//     return ButtonTheme(
//       minWidth: 150.0,
//       height: 60,
//       child: RaisedButton.icon(
//           onPressed: () {},
//           color: _color,
//           icon: Icon(
//             _icon,
//             color: Colors.white,
//           ),
//           label: Text(
//             _btnText,
//             style: TextStyle(color: Colors.white),
//           )),
//     );
//   }
// }
