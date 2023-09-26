import 'package:bloc_assignment/pages/auth/signup.dart';
import 'package:bloc_assignment/pages/auth/login.dart';
import 'package:bloc_assignment/pages/home.dart';
import 'package:bloc_assignment/pages/nav/data.dart';
import 'package:bloc_assignment/pages/nav/insights.dart';
import 'package:bloc_assignment/pages/nav/notifications.dart';
import 'package:bloc_assignment/pages/nav/providers.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';



final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();



final GoRouter router = GoRouter(
  
  routes: <RouteBase>[


    GoRoute(
      path: '/login',
      builder: ( BuildContext context , GoRouterState state  ) {
        return const Login();
      },
    ),

    GoRoute(
      path: '/signup',
      builder: ( BuildContext context , GoRouterState state  ) {
        return const Signup();
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, routedPage) => HomeScreen(routedPage),
      branches: [
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/insights',
              builder: (context, state) => const Insights(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/providers',
              builder: (context, state) => const Providers(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/data',
              builder: (context, state) => const Data(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/notifications',
              builder: (context, state) => const Notifications(),
            ),
          ],
        ),
      ]
    ),


  ],
  initialLocation: '/login',
  navigatorKey: _navKey,
);

