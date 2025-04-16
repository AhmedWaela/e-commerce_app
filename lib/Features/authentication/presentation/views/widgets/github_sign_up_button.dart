
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/backends.dart';
import '../../../data/repo/github_sign_up_repo/github_sign_up_repo.dart';
import '../../manager/github_sign_up_cubit/github_sign_up_cubit.dart';
import 'social_media_item.dart';

class GithubSignUpButton extends StatelessWidget {
  const GithubSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GithubSignUpCubit>(
      create: _provideGithubSignUpCubit,
      child: BlocConsumer<GithubSignUpCubit, GithubSignUpState>(
        listener: (BuildContext context, GithubSignUpState state) {
          if (state is GithubSignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is GithubSignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Sign up success"),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          return SocialMediaItem(
            isLoading: state is GithubSignUpLoading,
            logo: "assets/images/github.svg",
            onTap: () async {
              await context.read<GithubSignUpCubit>().signUpWithGithub(context);
            },
          );
        },
      ),
    );
  }

  GithubSignUpCubit _provideGithubSignUpCubit(BuildContext context) {
    final GithubSignUpRepo firebaseGithubSignUpRepoImpl = GithubSignUpRepo.getFactory(BackEnds.supabase);
    return GithubSignUpCubit(firebaseGithubSignUpRepoImpl);
  }
}
