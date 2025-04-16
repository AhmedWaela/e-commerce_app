part of 'github_sign_up_cubit.dart';

@immutable
sealed class GithubSignUpState {
  const GithubSignUpState();
}

final class GithubSignUpInitial extends GithubSignUpState {}

final class GithubSignUpLoading extends GithubSignUpState {}

final class GithubSignUpSuccess extends GithubSignUpState {}

final class GithubSignUpFailure extends GithubSignUpState {
  final String message;

  const GithubSignUpFailure({required this.message});
}
