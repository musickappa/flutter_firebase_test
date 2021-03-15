import "package:flutter/material.dart";

class MainModel extends ChangeNotifier{
  String kappa = "musickappaだぜ";

  void changeText(){
    kappa = "musickappaだよ～～ん";
    notifyListeners();
  }
}