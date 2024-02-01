import 'package:flutter/material.dart';

class YourDataProvider extends ChangeNotifier {
  String amount = "0.00";

  void updateAmount(String newAmount) {
    amount = newAmount;
    notifyListeners();
  }
}
