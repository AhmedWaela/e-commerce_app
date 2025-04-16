import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/repo/github_sign_up_repo/github_sign_up_repo.dart';
part 'github_sign_up_state.dart';

class GithubSignUpCubit extends Cubit<GithubSignUpState> {
  GithubSignUpCubit(this.githubSignUpRepo) : super(GithubSignUpInitial());
  final GithubSignUpRepo githubSignUpRepo;

  Future<void> signUpWithGithub(BuildContext context) async {
    _startLoading();
    Either<Failure, void> result = await _signUpWithGithub(context);
    _handleStates(result);
  }

  void _handleStates(Either<Failure, void> result) {
    result.fold(
      (Failure failure) {
        emit(GithubSignUpFailure(message: failure.message));
      },
      (void success) {
        emit(GithubSignUpSuccess());
      },
    );
  }

  Future<Either<Failure, void>> _signUpWithGithub(BuildContext context) async {
    final Either<Failure, void> result =
        await githubSignUpRepo.signUpWithGithub(context);
    return result;
  }

  void _startLoading() {
    emit(GithubSignUpLoading());
  }
}
