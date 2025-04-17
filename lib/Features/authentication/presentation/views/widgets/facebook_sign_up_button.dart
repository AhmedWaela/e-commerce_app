import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/backends.dart';
import '../../../../visual_search/presentation/views/visual_search_view.dart';
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
          if (state is FacebookSignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Sign up success"),
                backgroundColor: Colors.green,
              ),
            );
               context.push(VisualSearchView.route);
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
