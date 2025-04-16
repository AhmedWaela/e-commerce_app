import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_auth_service.dart';
import 'github_sign_up_repo.dart';

class FirebaseGithubSignUpRepoImpl implements GithubSignUpRepo {
  final FirebaseAuthService firebaseAuthService;

  const FirebaseGithubSignUpRepoImpl(this.firebaseAuthService);
  @override
  Future<Either<Failure, void>> signUpWithGithub(BuildContext context) async {
    try {
      await firebaseAuthService.authWithGithub(context);
      return right(null);
    } catch (exception) {
      return left(Failure(message: exception.toString()));
    }
  }
}
