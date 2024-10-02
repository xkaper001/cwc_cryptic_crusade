import 'package:cwc_cryptic_crusade/utils/router.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              controller: emailController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'team_uid',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'play_key',
              ),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                AppRoutes.router.go(AppRoutes.home);
              },
              child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ], 
        ),
      ),
    );
  }
}
