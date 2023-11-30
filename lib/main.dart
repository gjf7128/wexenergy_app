// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wexenergy_app/Pages/business_info_page.dart';
import 'package:wexenergy_app/Pages/roomlist.dart';
import 'package:wexenergy_app/Pages/window_list.dart';
import 'package:wexenergy_app/Pages/window_type.dart';
import 'package:wexenergy_app/Pages/windowspecs_page.dart';
import 'package:wexenergy_app/Pages/home_page.dart';

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
      ),
      GoRoute(
        path: '/HomePage',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/BusinessInfoPage',
        builder: (context, state) => const BusinessInfoPage(),
      ),
      GoRoute(
        path: '/RoomListPage',
        builder: (context, state) => MyRoomListPage(),
      ),
      GoRoute(
        path: '/WindowListPage',
        builder: (context, state) => WindowList(),
      ),
      GoRoute(
        path: '/WindowTypePage',
        builder: (context, state) => MeasurementPage(),
      ),
      GoRoute(
        path: '/WindowSpecsPage',
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
