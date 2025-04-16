part of 'facebook_sign_up_cubit.dart';

@immutable
sealed class FacebookSignUpState {
  const FacebookSignUpState();
}

final class FacebookSignUpInitial extends FacebookSignUpState {}


final class FacebookSignUpLoading extends FacebookSignUpState {}

final class FacebookSignUpSuccess extends FacebookSignUpState {}

final class FacebookSignUpFailure extends FacebookSignUpState {
  final String message;

  const FacebookSignUpFailure({required this.message});
}
