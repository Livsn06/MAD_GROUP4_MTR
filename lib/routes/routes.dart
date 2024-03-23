// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gutlay_etr_mad/screen/ingamescreen.dart';
import 'package:gutlay_etr_mad/screen/mainscreen.dart';
import 'package:gutlay_etr_mad/screen/titlescreen.dart';

class CustomScreenRoutes {
  //
  static void goto_IngameScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const IngameScreen(),
      ),
    );
  }

  //
  static void goto_TitleScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TitleScreen(),
      ),
    );
  }

  //
}

var screenRouters = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'mainpage',
      path: '/',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          name: 'titlepage',
          path: 'title',
          builder: (context, state) => const TitleScreen(),
        ),
        GoRoute(
          name: 'ingamepage',
          path: 'ingame',
          builder: (context, state) => const IngameScreen(),
        ),
      ],
    ),
  ],
);
