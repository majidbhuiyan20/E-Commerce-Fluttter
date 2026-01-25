import 'package:crafty_bey/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Selector'),
      ),
      body: Row(
        children: [
          Text(AppLocalizations.of(context)!.changeLanguage),
          DropdownMenu(dropdownMenuEntries: [
            DropdownMenuEntry(value: 'en', label: "English"),
            DropdownMenuEntry(value: 'bn', label: "Bangla"),
          ])
        ],
      )
    );
  }
}
