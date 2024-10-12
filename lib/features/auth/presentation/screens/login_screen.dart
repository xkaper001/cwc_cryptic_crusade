import 'package:cwc_cryptic_crusade/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cwc_cryptic_crusade/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController teamIdController;
  late TextEditingController playKeyController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    teamIdController = TextEditingController();
    playKeyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
            if (state is AuthSuccess) {
              AppRoutes.router.go(AppRoutes.home);
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'SpaceMono',
                      // height: 1,
                    ),
                    'Enter the\nCryptic Crusade',
                  ),
                  const SizedBox(height: 56),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the team_uid";
                      }
                      return null;
                    },
                    controller: teamIdController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'team_uid',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the play_key";
                      }
                      // TODO: Change this to 8
                      if (value.length != 7) {
                        return "play_key is exactly 8 characters";
                      }
                      return null;
                    },
                    controller: playKeyController,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'play_key',
                    ),
                  ),
                  const SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(AuthLoginEvent(
                              teamIdController.text.trim(),
                              playKeyController.text.trim(),
                            ));
                      }
                    },
                    child: (state is AuthLoading)
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
