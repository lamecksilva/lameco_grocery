import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lameco_grocery/src/pages/auth/components/custom_text_field.dart';
import 'package:lameco_grocery/src/pages/auth/sign_up_screen.dart';
import 'package:lameco_grocery/src/pages/base/base_screen.dart';
import 'package:lameco_grocery/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(children: [
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome do App
                    Text.rich(TextSpan(
                        style: const TextStyle(fontSize: 40),
                        children: [
                          const TextSpan(
                              text: 'Green',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Grocer',
                              style: TextStyle(
                                  color: CustomColors.customContrastColor))
                        ])),

                    // Categorias
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration.zero,
                            animatedTexts: [
                              FadeAnimatedText('Frutas'),
                              FadeAnimatedText('Legumes'),
                              FadeAnimatedText('Verduras'),
                              FadeAnimatedText('Carnes'),
                              FadeAnimatedText('Cereais'),
                              FadeAnimatedText('Laticíneos'),
                            ]),
                      ),
                    ),
                  ]),
            ),

            // Formulário
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(45))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                          child: const Text('Entrar',
                              style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (c) {
                              return const BaseScreen();
                            }));
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
                          child: Text("Esqueceu a senha?",
                              style: TextStyle(
                                  color: CustomColors.customContrastColor))),
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
                              side: const BorderSide(
                                  width: 2, color: Colors.green)),
                          onPressed: () {
                            print("Criar Conta");
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (c) {
                              return SignUpScreen();
                            }));
                          },
                          child: const Text(
                            "Criar Conta",
                            style: TextStyle(fontSize: 18),
                          )),
                    )
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
