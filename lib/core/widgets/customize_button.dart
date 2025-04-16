import 'package:e_commerce_app/Features/authentication/presentation/manager/email_sign_up_cubit/email_sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: MediaQuery.sizeOf(context).width > 500 ? 12 : 6,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Center(
            child:
                BlocSelector<EmailSignUpCubit, EmailSignUpState, bool>(
              selector: (state) => state is SignUpLoading,
              builder: (context, state) {
                if (state) {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                }
                return Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).width > 500 ? 30 : 14,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
