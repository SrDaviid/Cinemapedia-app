import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.indigo),
          ),
          onPressed: () {
            context.go('/');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const SizedBox(
              width: 60,
              child: Text(
                'Log in',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
