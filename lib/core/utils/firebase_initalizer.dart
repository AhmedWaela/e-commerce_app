import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseInitializer {
  
  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp();
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }
}
