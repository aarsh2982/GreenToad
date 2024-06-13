// Go Router Configuration
// App Routes Class
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// views
import 'package:greentoad_app/views/splash/splash_view.dart';
import 'package:greentoad_app/views/home/home_view.dart';
import 'package:greentoad_app/views/settings/settings_view.dart';
import 'package:greentoad_app/views/notifications/notifications_view.dart';

// App Router
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/splash",
    routes: [
      GoRoute(
        path: "/splash",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeView(),

        // adds custom fade-in animation
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: "/settings",
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: "/notifications",
        builder: (context, state) => const NotificationsView(),
      ),
    ],
  );
}
