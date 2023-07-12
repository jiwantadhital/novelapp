import 'package:flutter/material.dart';

class PracticeController with ChangeNotifier{
int number = 0;

  adding(){
   number = number +1;
   notifyListeners();
}




}