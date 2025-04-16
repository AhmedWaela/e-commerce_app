import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool Function(String value)? validator;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.textInputAction,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final ValueNotifier<bool?> isValidNotifier = ValueNotifier<bool?>(null);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.validator != null) {
        isValidNotifier.value = widget.validator!(widget.controller.text);
      }
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    isValidNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 64,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              cursorColor: Colors.black,
              cursorWidth: 1,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: widget.labelText,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          ValueListenableBuilder<bool?>(
            valueListenable: isValidNotifier,
            builder: (BuildContext context, bool? isValid, Widget? child) {
              if (isValid == true) {
                return const Icon(
                  Icons.check,
                  color: Colors.green,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
