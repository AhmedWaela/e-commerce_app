import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Features/authentication/presentation/views/sign_up_view.dart';
import '../../Features/visual_search/presentation/views/searching_by_taking_photo_view.dart';
import '../../Features/visual_search/presentation/views/visual_search_view.dart';
import '../../Features/visual_search/presentation/views/widgets/searching_by_taking_photo_view_body.dart';

class AppRouter {
  static final GoRouter routers = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SignUpView.route,
        builder: (BuildContext context, GoRouterState state) {
          return SignUpView();
        },
      ),
       GoRoute(
        path: VisualSearchView.route,
        builder: (BuildContext context, GoRouterState state) {
          return VisualSearchView();
        },
      ),
             GoRoute(
        path: SearchingByTakingPhotoView.route,
        builder: (BuildContext context, GoRouterState state) {
          return SearchingByTakingPhotoView();
        },
      ),
             GoRoute(
        path: FindingSimilarResultsScreen.route,
        builder: (BuildContext context, GoRouterState state) {
          return FindingSimilarResultsScreen();
        },
      ),

      
    ],
  );
}
