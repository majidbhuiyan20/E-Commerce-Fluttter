import 'package:flutter/cupertino.dart';

class MainNavContainerProvider extends ChangeNotifier{
  int _selectedIndex = 0;
  get selectedIndex => _selectedIndex;

  void changeItem(int index){
    if(_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }

  void changToCategories(){
    changeItem(1);
  }

  void changeToHome(){
    changeItem(0);
  }
}