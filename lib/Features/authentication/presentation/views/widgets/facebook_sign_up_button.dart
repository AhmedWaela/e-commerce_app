import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/backends.dart';
import '../../../data/repo/facebook_sign_up_repo/facebook_sign_up_repo.dart';
import '../../manager/facebook_sign_up_cubit/facebook_sign_up_cubit.dart';
import 'social_media_item.dart';

class FacebookSignUpButton extends StatelessWidget {
  const FacebookSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: provideFacebookSignUpCubit,
      child: BlocConsumer<FacebookSignUpCubit, FacebookSignUpState>(
        listener: (BuildContext context,FacebookSignUpState state) {
          if (state is FacebookSignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (BuildContext context,FacebookSignUpState state) {
          return SocialMediaItem(
            onTap: () async {
              await context.read<FacebookSignUpCubit>().signInWithFacebook();
            },
            logo: "assets/images/facebook.svg",
            isLoading: state is FacebookSignUpLoading,
          );
        },
      ),
    );
  }

  static FacebookSignUpCubit provideFacebookSignUpCubit(context) {
    final backEnd = FacebookSignUpRepo.getFactory(BackEnds.firebase);
    return FacebookSignUpCubit(backEnd);
  }
}
