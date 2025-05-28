// 📄 welcome_screen.dart
// 🕓 Última actualización: 2025-05-28 11:26 (GMT-5)

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.auto_stories,
              size: 100,
              color: Colors.indigo,
            ),
            const SizedBox(height: 30),
            const Text(
              'LECTOR GLOBAL',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Si puedes leer, puedes comprender. Y si puedes comprender, puedes cambiar tu vida. Y si cambiamos vidas, cambiamos el mundo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Iniciar'),
            ),
          ],
        ),
      ),
    );
  }
}
