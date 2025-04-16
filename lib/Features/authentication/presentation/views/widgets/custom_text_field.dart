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
    return AspectRatio(
      aspectRatio:MediaQuery.sizeOf(context).width > 500 ? 4 : 3.5,
      child: Container(
        margin:  EdgeInsets.only(bottom: MediaQuery.sizeOf(context).width > 500 ? 40 : 8),
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.06, vertical: MediaQuery.sizeOf(context).height * 0.01),
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
                cursorHeight: MediaQuery.sizeOf(context).width > 500 ? 80 : null,
                controller: widget.controller,
                textInputAction: widget.textInputAction,
                cursorColor: Colors.black,
                cursorWidth: MediaQuery.sizeOf(context).width > 500 ? 5 : 1,
                style:  TextStyle(fontSize: MediaQuery.sizeOf(context).width * 0.06),
                decoration: InputDecoration(
                  
                  contentPadding: EdgeInsets.zero,
                  labelText: widget.labelText,
                  labelStyle:  TextStyle(color: Colors.grey,fontSize: MediaQuery.sizeOf(context).width * 0.06),
                  border: InputBorder.none,
                ),
              ),
            ),
            ValueListenableBuilder<bool?>(
              valueListenable: isValidNotifier,
              builder: (BuildContext context, bool? isValid, Widget? child) {
                if (isValid == true) {
                  return  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: MediaQuery.sizeOf(context).width * 0.06,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
