// 📄 reset_password_screen.dart
// 🕓 Última actualización: 2025-05-29 08:45 (GMT-5)
// ✅ Internacionalización completa y validada

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _errorText;
  bool _emailSent = false;

  Future<void> _sendResetEmail() async {
    final email = _emailController.text.trim();
    final loc = AppLocalizations.of(context)!;

    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        _errorText = loc.invalidEmail;
      });
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      setState(() {
        _emailSent = true;
        _errorText = null;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorText = e.message ?? loc.unexpectedError;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.resetPasswordTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              loc.resetPasswordPrompt,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: loc.emailLabel,
                errorText: _errorText,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendResetEmail,
              child: Text(loc.sendResetLink),
            ),
            const SizedBox(height: 20),
            if (_emailSent)
              Text(
                loc.emailSentMessage,
                style: const TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
