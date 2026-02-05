import 'package:flutter/cupertino.dart';

class MainNavContainerProvider extends ChangeNotifier{
  int _selectedIndex = 0;
  get selectedIndex => _selectedIndex;

  void changeItem(int index){
    if(_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }
}