// 📄 profile_screen.dart
// 🕓 Última actualización: 2025-05-28 10:50 (GMT-5)

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre:',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              user?.displayName ?? 'No disponible',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Correo:',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              user?.email ?? 'No disponible',
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
                child: const Text('Cerrar sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
