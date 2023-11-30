import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wexenergy_app/Pages/business_info_page.dart';
import 'package:wexenergy_app/Pages/floorList.dart';
import 'package:wexenergy_app/Pages/window_list.dart';
import 'package:wexenergy_app/Pages/window_type.dart';
import 'package:wexenergy_app/Pages/windowspecs_page.dart';
import 'package:wexenergy_app/Pages/roomList.dart';
import 'package:wexenergy_app/Pages/models.dart';

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
        path: '/BusinessInfoPage',
        builder: (context, state) => const BusinessInfoPage(),
      ),
      GoRoute(
        path: '/FloorListPage',
        builder: (context, state) => MyFloorListPage(),
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
