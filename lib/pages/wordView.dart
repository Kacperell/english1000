import 'dart:ui';
import 'package:english1000/pages/home.dart';
import 'package:english1000/pages/listWords.dart';
import 'package:english1000/providers/words_provider.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import '../ap_localisations.dart';

class WordView extends StatefulWidget {
  final Color _appBarColor;
  final int _category_of_state;
  var _wordQuery;
  int _isItFromList;
  var toPage;
  // if 0 it isnt from list
  //jestli 1 to z listy znanych jestli 2 to z listy nie znanych
  WordView(this._appBarColor, this._category_of_state, this._wordQuery,
      [fromlist]) {
    if (fromlist == null) {
      this._isItFromList = 0;
      toPage = Home();
    } else {
      this._isItFromList = fromlist;
      switch (fromlist) {
        case 1:
          {
            toPage = WordList(1);
          }
          break;
        case 2:
          {
            toPage = WordList(2);
          }
          break;
      }
    }
  }

  @override
  _WordViewState createState() => _WordViewState();
}

class _WordViewState extends State<WordView> {
  double blur = 7.0; //7 blur,0 none

  @override
  Widget build(BuildContext context) {
    print(widget._isItFromList);
    // final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    return WillPopScope(
      onWillPop: () async {
        print(widget.toPage);
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.toPage,
          ),
        );
        // await Navigator.pushReplacementNamed(
        //   context,
        //   '/',
        // );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          backgroundColor: widget._appBarColor,
          title: const Text('English1000🎈'),
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
                      player.play('mp3/${widget._wordQuery['word']}.mp3');
                    }),
                Text(
                  widget._wordQuery['word'],
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
                              'mp3/${widget._wordQuery['word']}_sentence.mp3');
                        }),
                    Flexible(
                      child: Text(
                        '${AppLocalizations.of(context).translate('example')} ${widget._wordQuery['example_sentence']}',
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
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
                              AppLocalizations.of(context)
                                  .translate('${widget._wordQuery["word"]}'),
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(height: 10),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    AppLocalizations.of(context).translate(
                                        '${widget._wordQuery["word"]}_sentence'),
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      height: 150.0,
                      // height: 130.0,
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
                            height: 150.0,
                            color: Colors.black.withOpacity(0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
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
                      widget._wordQuery['id'],
                      widget._wordQuery['state'],
                      1,
                      widget._appBarColor,
                    ),
                    KnowOrNotButton(
                      AppLocalizations.of(context).translate('not_know'),
                      Icons.repeat,
                      Colors.red[800],
                      widget._wordQuery['id'],
                      widget._wordQuery['state'],
                      2,
                      widget._appBarColor,
                    ),
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
  final Color __appBarColorToNextWord;
  final int _word_id;
  final int _categoryState;
  final int _to_categoryState;

  // final int _categoryState;
  KnowOrNotButton(
    this._btnText,
    this._icon,
    this._color,
    this._word_id,
    this._categoryState,
    this._to_categoryState,
    this.__appBarColorToNextWord,
  );

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

  void ostanieSlowkoZtejKategoriiDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)
                  .translate('last_word_from_cateogry')),
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
                var ms = (new DateTime.now()).millisecondsSinceEpoch;
                var now = (ms / 1000).round();
                //updated state and date
                await WordsProvider.updateWord(
                    _to_categoryState, _word_id, now);

                List<Map> wordsQuery =
                    await WordsProvider.getWordsFromState(_categoryState);
                //albo
                var wordQuery =
                    await WordsProvider.getOneWordFromState(_categoryState);

//to chyba awiwat bo jak sie za syzkbo klinie to lipa
                if (wordsQuery.isEmpty) {
                  emptyshowDialog(context);
                  return;
                }
                // var nextWord = wordsQuery[0];
                var nextWord = wordQuery[0];

                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WordView(__appBarColorToNextWord,
                            _categoryState, nextWord)));
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
