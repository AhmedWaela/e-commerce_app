import 'package:flutter/material.dart';
import 'arrow_back_ios_icon_button.dart';

class SignUpViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignUpViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.02,top:MediaQuery.sizeOf(context).height * 0.02 ),
      child: AppBar(
        leading: const ArrowBackIosIconButton(),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
