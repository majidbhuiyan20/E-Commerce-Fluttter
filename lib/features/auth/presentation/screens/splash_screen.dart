import 'package:crafty_bey/features/auth/presentation/providers/auth_controller.dart';
import 'package:crafty_bey/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bey/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bey/features/auth/presentation/widgts/app_logo.dart';
import 'package:flutter/material.dart';
import '../../../common/presentation/screens/main_nav_holder_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splashScreen';


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  void _moveToNextScreen()async{
   await Future.delayed(Duration(seconds: 2));
   await AuthController.getUserData();
   Navigator.pushNamedAndRemoveUntil(context, MainNavHolderScreen.routeName, (predicate)=> false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),


          ],
        ),
      ),

    );
  }
}
