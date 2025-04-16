import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/repo/facebook_sign_up_repo/facebook_sign_up_repo.dart';
part 'facebook_sign_up_state.dart';

class FacebookSignUpCubit extends Cubit<FacebookSignUpState> {
  FacebookSignUpCubit(this.facebookSignInRepoImpl): super(FacebookSignUpInitial());

  final FacebookSignUpRepo facebookSignInRepoImpl;

  Future<void> signInWithFacebook() async {
    _startLoading();
    Either<Failure, void> result = await _signInWithFacebook();
    _handleStates(result);
  }

  void _handleStates(Either<Failure, void> result) {
    result.fold(
      (failure) {
        emit(FacebookSignUpFailure(message: failure.message));
      },
      (success) {
        emit(FacebookSignUpSuccess());
      },
    );
  }

  Future<Either<Failure, void>> _signInWithFacebook() async {
    final result = await facebookSignInRepoImpl.signInWithFacebook();
    return result;
  }

  void _startLoading() {
     emit(FacebookSignUpLoading());
  }
}
