import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int _selectedId = 0;
  String _transporte = 'Colectivo';
  String _tiempo = 'Día';

  int get selectedId => this._selectedId;
  set selectedId(int selectedId) {
    this._selectedId = selectedId;
    notifyListeners();
  }

  String get transporte => this._transporte;
  set transporte(String transporte) {
    this._transporte = transporte;
    notifyListeners();
  }

  String get tiempo => this._tiempo;
  set tiempo(String tiempo) {
    this._tiempo = tiempo;
    notifyListeners();
  }
}
