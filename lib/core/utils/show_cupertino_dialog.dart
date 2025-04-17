import 'package:flutter/material.dart';
import 'package:snackify/enums/snack_enums.dart';
import 'package:snackify/snackify.dart';

void showCustomSnackbar(BuildContext context,String title,String subtitle,SnackType type ) {
    Snackify.show(
      context: context,
      type: type,
      title: Text(title),
      subtitle: Text(subtitle),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      position: SnackPosition.top,
      persistent: true, // Set to true to keep Snackbar visible until manually dismissed
    );
  }