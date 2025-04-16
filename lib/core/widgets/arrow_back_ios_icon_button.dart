import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArrowBackIosIconButton extends StatelessWidget {
  const ArrowBackIosIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () => context.pop(),
      child: Icon(
        Icons.arrow_back_ios,
        size: screenHight * 0.03,
      ),
    );
  }
}
