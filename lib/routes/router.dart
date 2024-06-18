// Go Router Configuration
// App Routes Class
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// views
import 'package:greentoad_app/views/splash/splash_view.dart';
import 'package:greentoad_app/views/home/home_view.dart';
import 'package:greentoad_app/views/settings/settings_view.dart';
import 'package:greentoad_app/views/notifications/notifications_view.dart';
import 'package:greentoad_app/views/taskboards/taskboards_view.dart';
import 'package:greentoad_app/views/taskboards/create_taskboard_view.dart';
import 'package:greentoad_app/views/taskboards/single_taskboard_view.dart';

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

        // adds custom fade-in animation
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
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
      GoRoute(
        path: "/taskboards",
        builder: (context, state) => const TaskBoardsView(),
      ),
      GoRoute(
        path: "/taskboards/create",

        // custom page animation
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CreateTaskBoardView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: "/taskboards/:id",

        // custom page animation
        pageBuilder: (context, state) {
          //
          final id = state.pathParameters["id"]!;

          return CustomTransitionPage(
            child: SingleTaskBoardView(
              boardId: id,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).chain(
                    CurveTween(curve: Curves.ease),
                  ),
                ),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
