import 'package:flutter/material.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({
    super.key,
    this.onTap,
    required this.isLoading,
    required this.color,
    required this.hasBorder, required this.text,
  });
  final void Function()? onTap;
  final bool isLoading;
  final Color color;
  final bool hasBorder;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: MediaQuery.sizeOf(context).width > 500 ? 12 : 6,
        child: Container(
          decoration: BoxDecoration(
            border:
                hasBorder ? Border.all(width: 1, color: Colors.white) : null,
            color: color,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text(
                      text,
                      style: TextStyle(
                        fontSize:
                            MediaQuery.sizeOf(context).width > 500 ? 30 : 14,
                        color: Colors.white,
                      ),
                    )),
        ),
      ),
    );
  }
}
