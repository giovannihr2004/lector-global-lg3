// 📄 profile_screen.dart
// 🕓 Última actualización: 2025-05-29 08:10 (GMT-5)
// ✅ Internacionalización completa con AppLocalizations

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/drawer_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.profileTitle),
        centerTitle: true,
      ),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.profileNameLabel,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              user?.displayName ?? loc.notAvailable,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Text(
              loc.profileEmailLabel,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              user?.email ?? loc.notAvailable,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    Navigator.of(context).pushReplacementNamed('/login');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: Text(loc.logoutButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
