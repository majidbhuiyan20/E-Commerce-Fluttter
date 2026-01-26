import 'package:crafty_bey/app/extensions/localization_extension.dart';
import 'package:crafty_bey/app/providers/language_provider.dart';
import 'package:crafty_bey/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    print("This is Language selector");
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Selector'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.localizations.hello),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.changeMajid),
                DropdownMenu<String>(
                    initialSelection: context.read<LanguageProvider>().currentLocale.languageCode,
                    onSelected: (String? language){
                      context.read<LanguageProvider>().changeLocale(Locale(language!));
                    },
                    dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'en', label: "English"),
                  DropdownMenuEntry(value: 'bn', label: "Bangla"),
                  DropdownMenuEntry(value: 'de', label: "German"),
                ])
              ],
            ),
          ],
        ),
      )
    );
  }
}
