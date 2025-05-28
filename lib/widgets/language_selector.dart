// 📄 language_selector.dart
// 🕓 Última actualización: 2025-05-28 12:25 (GMT-5)

import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final String selectedLanguage;
  final Function(String) onLanguageChanged;

  const LanguageSelector({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedLanguage,
      onChanged: (String? newValue) {
        if (newValue != null) {
          onLanguageChanged(newValue);
        }
      },
      items: const [
        DropdownMenuItem(
          value: 'es',
          child: Text('Español'),
        ),
        DropdownMenuItem(
          value: 'en',
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: 'fr',
          child: Text('Français'),
        ),
        DropdownMenuItem(
          value: 'pt',
          child: Text('Português'),
        ),
        DropdownMenuItem(
          value: 'it',
          child: Text('Italiano'),
        ),
        DropdownMenuItem(
          value: 'de',
          child: Text('Deutsch'),
        ),
        DropdownMenuItem(
          value: 'ru',
          child: Text('Русский'),
        ),
        DropdownMenuItem(
          value: 'ja',
          child: Text('日本語'),
        ),
        DropdownMenuItem(
          value: 'zh',
          child: Text('中文'),
        ),
      ],
    );
  }
}
