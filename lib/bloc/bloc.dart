import 'package:flutter/material.dart';

class BlocProvider with ChangeNotifier {
  int _blocLiczba;
  BlocProvider(this._blocLiczba);

  getBloc() => _blocLiczba;
  setBloc(int liczba) {
    _blocLiczba = liczba;

    notifyListeners();
  }
}
