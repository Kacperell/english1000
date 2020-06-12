import 'dart:ui';

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
    print(widget.wordQuery['word']);
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
          // backgroundColor: arguments['colorAppbar'],
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
                      print("sound!");
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
                          print("sound!");
                          final player = AudioCache();
                          // call this method when desired
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
                RaisedButton.icon(
                    color: Colors.yellow[900],
                    onPressed: () {
                      setState(() {
                        print(blur);
                        if (blur == 0) {
                          blur = 7;
                          print('e');
                        } else {
                          blur = 0;
                          print('4');
                        }
                      });
                    },
                    icon: Icon(
                      Icons.lock_open,
                      color: Colors.white,
                    ),
                    label: Text(
                      AppLocalizations.of(context).translate('see_translete'),
                      style: TextStyle(color: Colors.white),
                    )),
                Row(
                  children: [],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
