import 'package:flutter/material.dart';

class AppService extends ChangeNotifier{

  void refresh(){
    notifyListeners();
  }
}