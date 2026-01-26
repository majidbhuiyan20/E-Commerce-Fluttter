import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier{
  Locale _currentLocale = Locale('en');

  Locale get currentLocale => _currentLocale;
  void changeLocale(Locale newLocale){
    if(_currentLocale == newLocale){
      return;
    }else{
      _currentLocale = newLocale;
      notifyListeners();
    }
  }
}