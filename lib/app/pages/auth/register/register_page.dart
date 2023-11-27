import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:fifa_world_cup_app/app/core/ui/widgets/app_button.dart';
import 'package:fifa_world_cup_app/app/pages/auth/register/presenter/i_register_presenter.dart';
import 'package:fifa_world_cup_app/app/pages/auth/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {

  final IRegisterPresenter presenter;

  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterView {

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bola.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Cadastrar usuário",
                style: context.textStyles.titleBlack,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameEC,
                      decoration: const InputDecoration(
                        label: Text("Nome Completo *"),
                      ),
                      validator: Validatorless.required("Obrigatório"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailEC,
                      decoration: const InputDecoration(
                        label: Text("Email *"),
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
                        label: Text("Senha *"),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.min(6, "Senha deve ter pelo menos 6 caracteres"),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _confirmPasswordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text("Confirma Senha *"),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.min(6, "Senha deve ter pelo menos 6 caracteres"),
                        Validatorless.compare(_passwordEC, "Senha diferente de Confirma Senha"),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppButton.primary(
                      label: "Cadastrar",
                      width: size.width * 0.9,
                      onPressed: () {
                        final validate = _formKey.currentState?.validate() ?? false;

                        if(validate) {

                          showLoader();

                          widget.presenter.register(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text,
                            confirmPassword: _confirmPasswordEC.text,
                          );
                        } 
                      },
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
