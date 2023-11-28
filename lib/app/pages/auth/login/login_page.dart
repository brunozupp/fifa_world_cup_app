import 'package:fifa_world_cup_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/presenter/i_login_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/auth/login/view/login_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {

  final ILoginPresenter presenter;

  const LoginPage({super.key, required this.presenter});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginView {

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: _formKey,
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
                    controller: _emailEC,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required("Obrigatório"),
                      Validatorless.email("Email inválido"),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordEC,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Senha"),
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required("Obrigatório"),
                      Validatorless.min(6, "Senha deve ter pelo menos 6 caracteres"),
                    ]),
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
                    onPressed: () {
                      
                      final validate = _formKey.currentState?.validate() ?? false;

                      if(validate) {

                        showLoader();

                        widget.presenter.login(
                          email: _emailEC.text,
                          password: _passwordEC.text,
                        );
                      } 
                    },
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
