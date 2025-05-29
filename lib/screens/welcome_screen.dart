// 📄 welcome_screen.dart
// 🕓 Última actualización: 2025-05-29 10:25 (GMT-5)
// ✅ Logo gráfico integrado, compatible con cambio dinámico de idioma e internacionalización

import 'package:flutter/material.dart';
import 'package:lector_global_lg3/widgets/language_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  final void Function(String)? onLocaleChanged;

  const WelcomeScreen({super.key, this.onLocaleChanged});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_welcome.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            Text(
              'LECTOR GLOBAL',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                localizations.welcomeSlogan,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(
              textKey: 'startButton',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              isLoading: false,
            ),
            const SizedBox(height: 30),
            if (onLocaleChanged != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: LanguageSelector(
                  selectedLanguage: Localizations.localeOf(context).languageCode,
                  onLanguageChanged: onLocaleChanged!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
