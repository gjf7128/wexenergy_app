import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String welcomeString = 'Log Into WexEnergy Windows App';
  static const String magicLinkLabel = 'Emailed code';
  static const String passwordLabel = 'Password';
  static const String usernameOrEmailLabel = 'Email';
  static const String submitButtonLabel = 'Submit';
  static const double widgetWidthSize = 250;
  static const double paddingAllSides = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: widgetWidthSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                  welcomeString), //TODO: (gjf7128): input wexEnergy image
              const Padding(
                padding: EdgeInsets.all(paddingAllSides),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: usernameOrEmailLabel,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(paddingAllSides),
                child: passwordTextField(),
              ),
              Padding(
                padding: const EdgeInsets.all(paddingAllSides),
                child: TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    context.go('/WindowSpecs'); //TODO: (gjf7128): Switch with BuildingInfoPage(Josh) 
                  }, // Transition here
                  child: const Text(submitButtonLabel),
                ),
              )
              // TODO: (gjf7128): Clickable Text 'forgot password?
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a magic link TextField
  ///
  /// Use this if we've settled on magic link over password
  Widget magicLinkTextField() {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: magicLinkLabel,
      ),
    );
  }

  /// Builds a password TextField.
  ///
  /// Use this if we've settled on password over magic link.
  Widget passwordTextField() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: passwordLabel,
      ),
    );
  }
}
