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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const CustomTextField(
              icon: Icons.email,
              label: "Email",
            ),
            const CustomTextField(
              icon: Icons.lock,
              label: "Password",
              isSecret: true,
            ),

            // Botão entrar
            SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  child: const Text('Entrar', style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    print("Entrar");
                  },
                )),

            // Esqueceu a senha
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    print("Esqueceu a senha");
                  },
                  child: const Text("Esqueceu a senha?",
                      style: TextStyle(color: Colors.red))),
            ),

            // Divider
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.withAlpha(90),
                      thickness: 2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Ou"),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.withAlpha(90),
                      thickness: 2,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 50,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      side: const BorderSide(width: 2, color: Colors.green)),
                  onPressed: () {
                    print("Criar Conta");
                  },
                  child: const Text(
                    "Criar Conta",
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ]),
        )
      ]),
    );
  }
}
