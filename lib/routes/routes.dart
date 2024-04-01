// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gutlay_etr_mad/screen/endcreditscreen.dart';
import 'package:gutlay_etr_mad/screen/endingscreen.dart';
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
      pageBuilder: (context, state) => _customTransitionPages(
          context: context,
          state: state,
          child: const MainScreen(),
          duration: Durations.long4),
      routes: [
        GoRoute(
          name: 'titlepage',
          path: 'title',
          builder: (context, state) => const TitleScreen(),
          pageBuilder: (context, state) => _customTransitionPages(
              context: context,
              state: state,
              child: const TitleScreen(),
              duration: Durations.short4),
        ),
        GoRoute(
          name: 'ingamepage',
          path: 'ingame',
          builder: (context, state) => const IngameScreen(),
          pageBuilder: (context, state) => _customTransitionPages(
              context: context,
              state: state,
              child: const IngameScreen(),
              duration: Durations.medium2),
        ),
        GoRoute(
          name: 'ending',
          path: 'ending',
          builder: (context, state) => const EndingScreen(),
          pageBuilder: (context, state) => _customTransitionPages(
              context: context,
              state: state,
              child: const EndingScreen(),
              duration: Durations.extralong4),
        ),
        GoRoute(
          name: 'credit',
          path: 'credit',
          builder: (context, state) => const EndCreditsScreen(),
          pageBuilder: (context, state) => _customTransitionPages(
              context: context,
              state: state,
              child: const EndCreditsScreen(),
              duration: Durations.extralong4),
        ),
      ],
    ),
  ],
);

CustomTransitionPage<void> _customTransitionPages(
    {required BuildContext context,
    required GoRouterState state,
    required Widget child,
    required Duration duration}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
