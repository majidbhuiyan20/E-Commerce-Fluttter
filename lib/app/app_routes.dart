import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings){
     Widget widget = SizedBox();
    if(settings.name == SplashScreen.routeName){
      widget = SplashScreen();
    }
    return MaterialPageRoute(builder: (ctx)=> widget);
  }
}