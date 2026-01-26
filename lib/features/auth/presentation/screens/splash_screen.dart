import 'package:crafty_bey/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bey/features/common/presentation/screens/main_nav_holder_screen.dart';
import 'package:crafty_bey/features/common/presentation/widgets/language_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/asset_paths.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgts/app_logo.dart';

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

  Future<void> _moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamedAndRemoveUntil(context, MainNavHolderScreen.routeName, (predicate)=> false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Spacer(),
              AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

