import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WexEnergy Windows App',
      routerConfig: _router,
    );
  }
}
