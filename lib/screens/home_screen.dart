// 📄 home_screen.dart
// 🕓 Última actualización: 2025-05-29 07:59 (GMT-5)
// ✅ Internacionalización completa y menú lateral incluido

import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appName),
        centerTitle: true,
      ),
      drawer: const DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              loc.welcomeMessage,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción futura: ir a sección de lectura
              },
              child: Text(loc.startButton),
            ),
          ],
        ),
      ),
    );
  }
}
