import 'package:flutter/material.dart';

class SeatIconNotifier extends ChangeNotifier{
  bool isPressed;

  SeatIconNotifier({this.isPressed = false});

  void onPressed(){
    isPressed = !isPressed;
    notifyListeners();
  }

}