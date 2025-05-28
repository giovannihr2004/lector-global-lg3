// 📄 home_screen.dart
// 🕓 Última actualización: 2025-05-28 10:45 (GMT-5)
// 📌 Parte 1 de 3: Estructura inicial, imports y declaración del widget principal.

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lector Global'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido a Lector Global!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción futura: ir a sección de lectura
              },
              child: const Text('Comenzar'),
            ),
          ],
        ),
      ),
    );
  }
}
