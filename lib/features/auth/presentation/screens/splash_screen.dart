import 'package:crafty_bey/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bey/features/auth/presentation/widgts/app_logo.dart';
import 'package:crafty_bey/features/common/presentation/widgets/language_selector.dart';
import 'package:crafty_bey/features/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

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

  void _moveToNextScreen(){
    Future.delayed(const Duration(seconds: 6), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          AppLogo(),
          Spacer(),


        ],
      ),

    );
  }
}
