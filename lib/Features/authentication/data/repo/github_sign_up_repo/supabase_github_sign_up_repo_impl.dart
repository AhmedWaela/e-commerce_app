import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/supabase_auth_service.dart';
import 'github_sign_up_repo.dart';

class SupabaseGithubSignUpRepoImpl implements GithubSignUpRepo {
  final SupabaseAuthService supabaseAuthService;

  const SupabaseGithubSignUpRepoImpl(this.supabaseAuthService);
  @override
  Future<Either<Failure, void>> signUpWithGithub(BuildContext context) async {
    try {
      await supabaseAuthService.authWithGithub(context);
      return right(null);
    } catch (exception) {
      return left(Failure(message: exception.toString()));
    }
  }
}
