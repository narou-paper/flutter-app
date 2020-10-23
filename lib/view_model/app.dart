import 'package:flutter/material.dart';

class NarouPagerAppViewModel extends ChangeNotifier {
  Widget _sliver;

  NarouPagerAppViewModel(this._sliver);

  get sliver => _sliver;

  set sliver(Widget sliver) {
    if (this._sliver == sliver) return;
    this._sliver = sliver;
    notifyListeners();
  }
}
