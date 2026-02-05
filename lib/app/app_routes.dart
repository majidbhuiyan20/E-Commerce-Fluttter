import 'package:crafty_bey/features/common/presentation/screens/main_nav_holder_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/verify_otp_screen.dart';
class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings){
     Widget widget = SizedBox();
    if(settings.name == SplashScreen.routeName){
      widget = SplashScreen();
    }
    else if(settings.name == SignUpScreen.routeName){
      widget = SignUpScreen();
    }
    else if(settings.name == SignInScreen.routeName){
      widget = SignInScreen();
    }
    else if(settings.name == VerifyOtpScreen.routeName){
      widget = VerifyOtpScreen();
    }
    else if(settings.name == MainNavHolderScreen.routeName){
      widget = MainNavHolderScreen();
    }

    return MaterialPageRoute(builder: (ctx)=> widget);
  }
}