import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_civil/utils/utils.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _onSubmit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    context.read<AuthCubit>().login(_email.text, _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.error) {
          errorDialog(context, state.error!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: Text('Se Connecter'),
          // ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Se connecter',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: 'Email',
                            labelText: 'Email',
                          ),
                          validator: (val) {
                            if (val!.isEmpty || val.trim().isEmpty) {
                              return 'required';
                            }
                            if (!val.contains('@')) {
                              return 'Email invalide';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                            obscureText: true,
                            controller: _password,
                            decoration: const InputDecoration(
                              isDense: true,
                              hintText: 'Mot de passe',
                              labelText: 'Mot de passe',
                            ),
                            validator: (val) {
                              if (val!.isEmpty || val.trim().isEmpty) {
                                return 'Champ obligatoire';
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                            onPressed: state.status == AuthStatus.loading
                                ? (){}
                                : () {
                              _onSubmit(context);
                            },
                            text:
                            state.status == AuthStatus.loading
                                ? "Patientez..."
                                : 'Se connecter',
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Aucun Compte ?'),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                        onTap: () {
                          context.read<AuthSwitchCubit>().toggle(false);
                        },
                        child: Text(
                          'Créer',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


