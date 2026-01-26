import 'package:crafty_bey/features/common/presentation/widgets/language_selector.dart';
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
  Widget build(BuildContext context) {
    return LanguageSelector();
  }
}
