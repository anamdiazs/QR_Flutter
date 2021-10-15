import 'package:flutter/material.dart';

class GestorProvider extends ChangeNotifier{
  int _selectedOption = 0;
  int get selectedOption {
    return this._selectedOption;
  }

  set selectedOption(int i) {
    this._selectedOption = i;
    notifyListeners();
  }
}
