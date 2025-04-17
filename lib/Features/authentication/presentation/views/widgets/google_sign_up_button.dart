import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/backends.dart';
import '../../../../visual_search/presentation/views/visual_search_view.dart';
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
             context.push(VisualSearchView.route);
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
    final backEnd = GoogleSignUpRepo.getFactory(BackEnds.supabase);
    return GoogleSignUpCubit(backEnd);
  }
}