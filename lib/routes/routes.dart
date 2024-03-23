// ignore_for_file: non_constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:gutlay_etr_mad/screen/ingamescreen.dart';
import 'package:gutlay_etr_mad/screen/mainscreen.dart';
import 'package:gutlay_etr_mad/screen/titlescreen.dart';

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
