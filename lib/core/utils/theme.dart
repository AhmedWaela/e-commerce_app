import 'package:flutter/material.dart';
import 'app_colors.dart';

class Theme 
{
 static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    );
  }
}