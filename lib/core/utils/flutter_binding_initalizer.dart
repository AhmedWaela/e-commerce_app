import 'package:flutter/material.dart';

class FlutterBindingInitializer {
  /// Ensures Flutter widgets are properly initialized.
  static void initialize() {
    WidgetsFlutterBinding.ensureInitialized();
  }
}