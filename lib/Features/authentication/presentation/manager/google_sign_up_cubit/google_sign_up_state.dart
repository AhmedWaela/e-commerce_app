part of 'google_sign_up_cubit.dart';

@immutable
sealed class GoogleSignUpState {
  const GoogleSignUpState();
}

final class GoogleSignUpInitial extends GoogleSignUpState {}

final class GoogleSignUpLoading extends GoogleSignUpState {}

final class GoogleSignUpSuccess extends GoogleSignUpState {}

final class GoogleSignUpFailure extends GoogleSignUpState {
  final String message;

  const GoogleSignUpFailure({required this.message});
}
