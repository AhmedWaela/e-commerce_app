import 'package:e_commerce_app/core/utils/show_cupertino_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snackify/enums/snack_enums.dart';
import '../../../../core/utils/backends.dart';
import '../../../visual_search/presentation/views/visual_search_view.dart';
import '../../data/repo/email_sign_up_repo/email_sign_up_repo.dart';
import '../manager/email_sign_up_cubit/email_sign_up_cubit.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  static const String route = "/";

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailSignUpCubit>(
      create: _provideEmailSignUpCubit,
      child: BlocListener<EmailSignUpCubit, EmailSignUpState>(
        listener: (BuildContext context, EmailSignUpState state) {
          if (state is SignUpFailure) {
            _showEmailSignUpFailure(context, state);
          }
          if (state is SignUpSuccess) {
            _showEmailSignUpSuccessMessage(context);
          }
        },
        child: const Scaffold(
          body: SignUpViewBody(),
        ),
      ),
    );
  }

  void _showEmailSignUpSuccessMessage(BuildContext context) {
    showCustomSnackbar(
      context,
      "Registration Successful",
      "Welcome! Your account has been created successfully.",
      SnackType.success,
    );
    context.push(VisualSearchView.route);
  }

  static EmailSignUpCubit _provideEmailSignUpCubit(BuildContext context) {
    final EmailSignUpRepo backEnd =
        EmailSignUpRepo.getFactory(BackEnds.supabase);
    return EmailSignUpCubit(backEnd);
  }

  static void _showEmailSignUpFailure(
      BuildContext context, SignUpFailure state) {
    showCustomSnackbar(
        context, "Sign Up Failure", state.message, SnackType.error);
  }
}
