import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings){
     Widget widget = SizedBox();
    if(settings.name == SplashScreen.routeName){
      widget = SplashScreen();
    }
    else if(settings.name == SignUpScreen.routeName){
      widget = SignUpScreen();
    }

    return MaterialPageRoute(builder: (ctx)=> widget);
  }
}