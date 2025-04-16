part of 'email_sign_up_cubit.dart';

@immutable
sealed class EmailSignUpState {
  const EmailSignUpState();
}

final class SignUpInitial extends EmailSignUpState {}


final class SignUpLoading extends EmailSignUpState {}

final class SignUpSuccess extends EmailSignUpState {}

final class SignUpFailure extends EmailSignUpState {
  final String message;

  const SignUpFailure({required this.message});
}