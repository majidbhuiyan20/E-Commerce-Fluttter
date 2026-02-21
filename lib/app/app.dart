import 'package:crafty_bey/app/app_routes.dart';
import 'package:crafty_bey/app/app_theme.dart';
import 'package:crafty_bey/app/providers/language_provider.dart';
import 'package:crafty_bey/app/providers/theme_provider.dart';
import 'package:crafty_bey/features/category/presentation/provider/category_list_provider.dart';
import 'package:crafty_bey/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import '../l10n/app_localizations.dart';

class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});

  @override
  State<CraftyBayApp> createState() => _CraftyBeyAppState();
}

class _CraftyBeyAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageProvider()..loadInitialLanguage(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider()..loadInitialThemeMode(),
        ),
        ChangeNotifierProvider(create: (_) => MainNavContainerProvider()),
        ChangeNotifierProvider(create: (_) => CategoryListProvider()),
      ],
      child: Consumer2<LanguageProvider, ThemeProvider>(
        builder: (context, languageProvider, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            onGenerateRoute: AppRoutes.routes,

            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: .light,

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: const [Locale('en'), Locale('bn'), Locale('de')],

            locale: languageProvider.currentLocale,
          );
        },
      ),
    );
  }
}
