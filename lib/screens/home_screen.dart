// 📄 home_screen.dart
// 🕓 Última actualización: 2025-05-28 11:55 (GMT-5)
// ✅ Versión con menú lateral incluido (DrawerMenu)

import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lector Global'),
        centerTitle: true,
      ),
      drawer: const DrawerMenu(),
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
