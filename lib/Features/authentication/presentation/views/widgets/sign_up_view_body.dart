import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/arrow_back_ios_icon_button.dart';
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
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width > 500 ? 28 : 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Align(
                alignment: Alignment.topLeft, child: ArrowBackIosIconButton()),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            AutoSizeText(
              "Sign up",
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width > 500 ? 75 : 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 73),
            CustomTextField(
              validator: (value) {
                if (value.isEmpty || value.length < 6) {
                  return false;
                }else{
                return true;
                }

              },
              controller: context.read<EmailSignUpCubit>().name,
              textInputAction: TextInputAction.next,
              labelText: "Name",
            ),
            CustomTextField(
                 validator: (value) {
                 final emailRegex = RegExp(
                    r'^[a-zA-Z0-9]+[a-zA-Z0-9._%-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if (value.isEmpty|| !emailRegex.hasMatch(value)) {
                  return false;
                }
                return true;
              },
              controller: context.read<EmailSignUpCubit>().email,
              textInputAction: TextInputAction.next,
              labelText: "Email",
            ),
            CustomTextField(
              validator: (value) {
                if (value.isEmpty || value.length < 6) {
                  return false;
                }
                return true;
              },
              controller: context.read<EmailSignUpCubit>().password,
              textInputAction: TextInputAction.done,
              labelText: "Password",
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.sizeOf(context).width > 500 ? 40 : 14),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.red,
                  size: MediaQuery.sizeOf(context).width > 500 ? 40 : 14,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.08),
            CustomizeButton(
              onTap: () async {
                await context
                    .read<EmailSignUpCubit>()
                    .signUpWithEmailAndPassword();
              },
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.08),
            AutoSizeText(
              "Or sign up with social account",
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width > 500 ? 40 : 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GoogleSignUpButton(),
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
