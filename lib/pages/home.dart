import 'package:english1000/bloc/bloc.dart';
import 'package:english1000/pages/info.dart';
import 'package:english1000/pages/wordView.dart';
import 'package:english1000/providers/words_provider.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ap_localisations.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  BannerAd myBanner = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.fullBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-9477426267530319~9841577958');
    super.initState();
    myBanner..load();
  }

  void showAds() {
    myBanner..show();
    print("-----sho  wad-----");
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    var myLocale2 = AppLocalizations.of(context);
    print(myLocale);
    print(myLocale2);
    BlocProvider _jakaLiczba = Provider.of<BlocProvider>(context);
    _jakaLiczba.setBloc(
        0); //ustawiamy na 0 bo ktos moze wrocil z kateogri slowek gdzie caigle klikal ze znam lub nie
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text('English1000 👅'),
          automaticallyImplyLeading: false, //hide back button
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.info_outline),
              tooltip: 'Info',
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(),
                  ),
                );
              },
            ),
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            // padding: const EdgeInsets.symmetric(vertical: 60),
            padding: const EdgeInsets.only(bottom: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // TODO moze tu logo dac?
                _HomeButton(AppLocalizations.of(context).translate('to_check'),
                    Icons.spellcheck, Colors.blue[800], 0, showAds),
                _HomeButton(
                    AppLocalizations.of(context).translate('checked_saved'),
                    Icons.check_circle_outline,
                    Colors.green[800],
                    1,
                    showAds),
                _HomeButton(AppLocalizations.of(context).translate('to_repeat'),
                    Icons.repeat, Colors.red[800], 2, showAds),
              ],
            ),
          ),
        ));
  }
}

class _HomeButton extends StatelessWidget {
  final String _text;
  final IconData _icon;
  final Color _color;
  final int _categoryState;
  Function showAds;
  _HomeButton(
      this._text, this._icon, this._color, this._categoryState, this.showAds);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 300.0,
      height: 70,
      child: FutureBuilder(
          future: WordsProvider.getCount(_categoryState),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (_categoryState == 0 && snapshot.data < 1) {
                // pozniej zrobic ze gdy bedize mniejszy od 985
                showAds();
              }
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

                  var wordQuery =
                      await WordsProvider.getOneWordFromState(_categoryState);
                  if (wordQuery.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(AppLocalizations.of(context)
                                  .translate('no_words')),
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
