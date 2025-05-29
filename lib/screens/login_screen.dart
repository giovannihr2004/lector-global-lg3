// 📄 login_screen.dart
// 🕓 Última actualización: 2025-05-29 09:30 (GMT-5)
// ✅ Uso de CustomButton con soporte internacional y carga visual

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      final user = userCredential.user;

      if (user != null && user.emailVerified) {
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/welcome');
        }
      } else {
        await FirebaseAuth.instance.signOut();
        setState(() {
          _errorMessage = AppLocalizations.of(context)!.verifyEmailError;
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.loginTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: loc.emailLabel),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? loc.enterEmail : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: loc.passwordLabel),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? loc.enterPassword : null,
              ),
              const SizedBox(height: 20),
              CustomButton(
                textKey: 'loginButton',
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          _signIn();
                        }
                      },
                isLoading: _isLoading,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
                child: Text(loc.noAccountPrompt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
