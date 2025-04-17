import 'package:flutter/material.dart';

import 'widgets/visual_search_view_body.dart';

class VisualSearchView extends StatelessWidget {
  const VisualSearchView({super.key});
  static const String route = "/visual-search-view";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VisualSearchViewBody(),
    );
  }
}