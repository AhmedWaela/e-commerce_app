import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/backends.dart';
import '../../../../core/widgets/customize_app_bar.dart';
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
        },
        child: const Scaffold(
          appBar: SignUpViewAppBar(),
          body: SignUpViewBody(),
        ),
      ),
    );
  }

  static EmailSignUpCubit _provideEmailSignUpCubit(BuildContext context) {
    final EmailSignUpRepo  backEnd = EmailSignUpRepo.getFactory(BackEnds.supabase);
    return EmailSignUpCubit(backEnd);
  }

  static void _showEmailSignUpFailure(
      BuildContext context, SignUpFailure state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
