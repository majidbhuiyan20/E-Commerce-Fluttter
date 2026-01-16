import 'package:crafty_bey/app/app_routes.dart';
import 'package:crafty_bey/app/app_theme.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/splash_screen.dart';

class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});

  @override
  State<CraftyBayApp> createState() => _CraftyBeyAppState();
}

class _CraftyBeyAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: AppRoutes.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      themeMode: .dark,


    );

  }
}


//check