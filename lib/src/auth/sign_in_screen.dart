import 'package:flutter/material.dart';
import 'package:lameco_grocery/src/auth/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
          child: Column(children: const [
            CustomTextField(
              icon: Icons.email,
              label: "Email",
              isObscure: false,
            ),
            CustomTextField(
              icon: Icons.lock,
              label: "Password",
              isObscure: true,
            ),
          ]),
        ))
      ]),
    );
  }
}
