import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/backends.dart';
import '../../../data/repo/google_sign_up_repo/google_sign_up_repo.dart';
import '../../manager/google_sign_up_cubit/google_sign_up_cubit.dart';
import 'social_media_item.dart';

class GoogleSignUpButton extends StatelessWidget {
  const GoogleSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GoogleSignUpCubit>(
      create: provideGoogleSignUpCubit,
      child: BlocConsumer<GoogleSignUpCubit, GoogleSignUpState>(
        listener: (context, state) {
          if (state is GoogleSignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is GoogleSignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Sign up success"),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          return SocialMediaItem(
            isLoading: state is GoogleSignUpLoading,
            logo: "assets/images/google.svg",
            onTap: () async {
              await context.read<GoogleSignUpCubit>().signUpWithGoogle();
            },
          );
        },
      ),
    );
  }

  GoogleSignUpCubit provideGoogleSignUpCubit(context) {
    final backEnd = GoogleSignUpRepo.getFactory(BackEnds.firebase);
    return GoogleSignUpCubit(backEnd);
  }
}