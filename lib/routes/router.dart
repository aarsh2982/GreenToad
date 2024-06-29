// Go Router Configuration
// App Routes Class
import 'package:go_router/go_router.dart';

// views
import 'package:greentoad_app/views/splash/splash_view.dart';
import 'package:greentoad_app/views/home/home_view.dart';
import 'package:greentoad_app/views/settings/settings_view.dart';
import 'package:greentoad_app/views/notifications/notifications_view.dart';
import 'package:greentoad_app/views/notifications/single_notification_view.dart';
import 'package:greentoad_app/views/taskboards/taskboards_view.dart';
import 'package:greentoad_app/views/taskboards/create_taskboard_view.dart';
import 'package:greentoad_app/views/taskboards/single_taskboard_view.dart';

// custome page transitions
import 'package:greentoad_app/routes/page_transitions.dart';

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
            return PageTransitions.fadePageTransition(animation, child);
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
        path: "/notifications/:id",
        pageBuilder: (context, state) {
          final id = state.pathParameters["id"]!;

          return CustomTransitionPage(
            child: SingleNotificationView(
              notificationId: id,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return PageTransitions.slideUpTransition(animation, child);
            },
          );
        },
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
            return PageTransitions.slideUpTransition(animation, child);
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
              return PageTransitions.slideUpTransition(animation, child);
            },
          );
        },
      ),
    ],
  );
}
