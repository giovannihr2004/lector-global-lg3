// 📄 custom_button.dart
// 🕓 Última actualización: 2025-05-29 08:50 (GMT-5)
// ✅ Soporte de internacionalización añadido para texto dinámico

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomButton extends StatelessWidget {
  // Ahora 'textKey' es la clave para obtener el texto localizado
  final String textKey;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color color;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.textKey,
    required this.onPressed,
    this.isLoading = false,
    this.color = Colors.blueAccent,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    // Obtener texto localizado dinámicamente usando la clave proporcionada
    final localizedText = _getLocalizedText(loc, textKey);

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: isLoading
          ? const SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
          : Text(
              localizedText,
              style: TextStyle(color: textColor),
            ),
    );
  }

  // Función auxiliar para mapear la clave a la cadena localizada
  String _getLocalizedText(AppLocalizations loc, String key) {
    switch (key) {
      case 'startButton':
        return loc.startButton;
      case 'registerButton':
        return loc.registerButton;
      case 'loginButton':
        return loc.loginButton;
      case 'sendResetLink':
        return loc.sendResetLink;
      case 'logoutButton':
        return loc.logoutButton;
      default:
        return key; // Retorna la clave si no encuentra traducción (fallback)
    }
  }
}
