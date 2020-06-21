import 'package:english1000/pages/home.dart';
import 'package:english1000/pages/listWords.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../ap_localisations.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );

        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: const Text('English1000🎈'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.redAccent,
                  size: 20.0,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('info_text'),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context).translate('info_what_else'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 13),
                Text(
                  AppLocalizations.of(context).translate('info_method1'),
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  AppLocalizations.of(context).translate('info_method2'),
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  AppLocalizations.of(context).translate('info_method3'),
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context).translate('info_lvl_up'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                // SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context).translate('info_lvl_up_app'),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("link andorid app"),
                    Icon(
                      Icons.phone_android,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    Text("link iOs app"),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)
                      .translate('info_lvl_up_app_price'),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                ButtonToStateList(
                    AppLocalizations.of(context).translate('know_list'),
                    Icons.check_circle_outline,
                    Colors.green[800],
                    1),
                ButtonToStateList(
                    AppLocalizations.of(context).translate('not_know_list'),
                    Icons.repeat,
                    Colors.red[800],
                    2),
                SizedBox(height: 100),
              ],
            ),
          )),
    );
  }
}

class ButtonToStateList extends StatelessWidget {
  final String _name;
  final IconData _icon;
  final Color _color;
  final int _state;
  ButtonToStateList(this._name, this._icon, this._color, this._state);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton.icon(
          onPressed: () async {
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => WordList(_state),
              ),
            );
          },
          icon: Icon(
            _icon,
            color: Colors.white,
          ),
          color: _color,
          label: Text(
            _name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}
