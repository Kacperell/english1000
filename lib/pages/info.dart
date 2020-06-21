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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text('English1000🎈'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                AppLocalizations.of(context).translate('info_lvl_up_app_price'),
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100),
            ],
          ),
        ));
  }
}
