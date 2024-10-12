import 'package:cwc_cryptic_crusade/features/game/game_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/screens/login_screen.dart';
import '../features/home/presentation/screens/end_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/onboard/presentation/screens/onboard_screen.dart';

class AppRoutes {
  static const home = '/home';
  static const login = '/login';
  static const onboard = '/onboard';
  static const game = '/game';
  static const end = '/end';

  static final router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.data != null) {
                return const HomeScreen();
              }
              return const LoginScreen();
            }),
      ),
      GoRoute(
        path: onboard,
        builder: (context, state) => const OnboardScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.data != null) {
                return const HomeScreen();
              }
              return const LoginScreen();
            }),
      ),
      GoRoute(
        path: game,
        builder: (context, state) => const GameScreen(),
      ),
      GoRoute(
        path: end,
        builder: (context, state) => const EndScreen(),
      )
      // GoRoute(
      //   path: level3,
      //   builder: (context, state) => const LevelScreen(),
      // ),
      // GoRoute(
      //   path: level4,
      //   builder: (context, state) => const LevelScreen(),
      // ),
      // GoRoute(
      //   path: level5,
      //   builder: (context, state) => const LevelScreen(),
      // ),
      // GoRoute(
      //   path: level6,
      //   builder: (context, state) => const LevelScreen(),
      // ),
      // GoRoute(
      //   path: level7,
      //   builder: (context, state) => const LevelScreen(),
      // ),
    ],
  );
}
