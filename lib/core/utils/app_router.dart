import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Features/authentication/presentation/views/sign_up_view.dart';

class AppRouter {
  static final GoRouter routers = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SignUpView.route,
        builder: (BuildContext context, GoRouterState state) {
          return SignUpView();
        },
      ),
    ],
  );
}
