import 'dart:ui';

import 'package:english1000/bloc/bloc.dart';
import 'package:english1000/providers/words_provider.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:provider/provider.dart';

import '../ap_localisations.dart';

class WordView extends StatefulWidget {
  final Color appBarColor;
  final int category_of_state;
  var wordQuery;

  WordView(
    this.appBarColor,
    this.category_of_state,
    this.wordQuery,
  );

  @override
  _WordViewState createState() => _WordViewState();
}

class _WordViewState extends State<WordView> {
  double blur = 7.0; //7 blur,0 none

  @override
  Widget build(BuildContext context) {
    // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    BlocProvider _jakaLiczba = Provider.of<BlocProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacementNamed(
          context,
          '/',
        );
        _jakaLiczba.setBloc(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          backgroundColor: widget.appBarColor,
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
                    Flexible(
                      child: Text(
                        '${AppLocalizations.of(context).translate('example')} ${widget.wordQuery['example_sentence']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
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
                              // widget.wordQuery['pl_translate'],
                              AppLocalizations.of(context)
                                  .translate('${widget.wordQuery["word"]}'),
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(height: 10),
                            Flexible(
                              child: Text(
                                  // widget.wordQuery['pl_example'],
                                  AppLocalizations.of(context).translate(
                                      '${widget.wordQuery["word"]}_sentence'),
                                  style: TextStyle(fontSize: 18)),
                            ),
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
                      widget.appBarColor,
                    ),
                    KnowOrNotButton(
                      AppLocalizations.of(context).translate('not_know'),
                      Icons.repeat,
                      Colors.red[800],
                      widget.wordQuery['id'],
                      widget.wordQuery['state'],
                      2,
                      widget.appBarColor,
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
  final Color _appBarColorToNextWord;
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
    this._appBarColorToNextWord,
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
    BlocProvider _jakaLiczba = Provider.of<BlocProvider>(context);
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
                if (wordsQuery.isEmpty) {
                  emptyshowDialog(context);
                  return;
                }
                print(_jakaLiczba.getBloc());
                if (_categoryState == _to_categoryState) {
                  _jakaLiczba.setBloc(_jakaLiczba.getBloc() + 1);
                } else {
                  _jakaLiczba.setBloc(0);
                }
                int numberOfNextWord = _jakaLiczba.getBloc();
                if (wordsQuery.length <= numberOfNextWord) {
                  // nie ten if tylko if spradjazczy czy numberOfNextWord nie jest?? of worQuery.lenght
                  ostanieSlowkoZtejKategoriiDialog(context);
                  _jakaLiczba.setBloc(0);
                  return;
                }
                // var nextWord = wordsQuery[numberOfNextWord];
                var nextWord = wordsQuery[0];
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WordView(
                            _appBarColorToNextWord, _categoryState, nextWord)));
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
