import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/customize_button.dart';
import '../../manager/email_sign_up_cubit/email_sign_up_cubit.dart';
import 'custom_text_field.dart';
import 'facebook_sign_up_button.dart';
import 'github_sign_up_button.dart';
import 'google_sign_up_button.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              "Sign up",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 73),
            CustomTextField(
              validator: (value) {
                if (value.isEmpty || value.length < 6) {
                  return false;
                }
                return true;
              },
              controller: context.read<EmailSignUpCubit>().name,
              textInputAction: TextInputAction.next,
              labelText: "Name",
            ),
            CustomTextField(
              controller: context.read<EmailSignUpCubit>().email,
              textInputAction: TextInputAction.next,
              labelText: "Email",
            ),
            CustomTextField(
              controller: context.read<EmailSignUpCubit>().password,
              textInputAction: TextInputAction.done,
              labelText: "Password",
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 28),
            CustomizeButton(
              onTap: () async {
                await context
                    .read<EmailSignUpCubit>()
                    .signUpWithEmailAndPassword();
              },
            ),
            const SizedBox(height: 126),
            const Text(
              "Or sign up with social account",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleSignUpButton(),
                SizedBox(width: 16),
                FacebookSignUpButton(),
                GithubSignUpButton()
              ],
            ),
            const SizedBox(height: 23),
          ],
        ),
      ),
    );
  }
}


