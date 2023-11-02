import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wexenergy_app/Pages/windowspecs_page.dart';

import 'Pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

//Insert pages here
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      //TODO: (gjf7128): GoRoute for BuildingInfoPage(Josh)
      //TODO: (gjf7128): GoRoute for RoomListPage(Bryan)
      //TODO: (gjf7128): GoRoute for WindowListPage(Xinyi)
      //TODO: (gjf7128): GoRoute for WindowTypePage(Xinyi)
      GoRoute(
        path: '/WindowSpecs',
        builder: (context, state) => WindowSpecsPage(),
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
