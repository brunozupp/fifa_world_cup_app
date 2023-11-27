import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_login.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(
                    height: size.height * (
                      size.width > 350 ? 0.30 : 0.25
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: context.textStyles.titleWhite,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Email"),
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Senha"),
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 6,
                    ),
                    child: Text(
                      "Esqueceu a senha?",
                      style: context.textStyles.textSecondaryFontMedium.copyWith(
                        color: context.colors.yellow,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AppButton(
                    width: size.width * 0.9,
                    style: context.buttonStyles.yellowButton,
                    labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                    label: "Entrar",
                    onPressed: () {},
                  ),
                ])
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    Text.rich(
                      style: context.textStyles.textSecondaryFontMedium.copyWith(
                        color: Colors.white,
                      ),
                      TextSpan(
                        text: "Não possui uma conta?",
                        children: [
                          TextSpan(
                            text: "Cadastre-se",
                            style: context.textStyles.textSecondaryFontMedium.copyWith(
                              color: context.colors.yellow,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.of(context).pushNamed("/auth/register");
                            }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
