import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/repo/google_sign_up_repo/google_sign_up_repo.dart';
part 'google_sign_up_state.dart';

class GoogleSignUpCubit extends Cubit<GoogleSignUpState> {
  GoogleSignUpCubit(this.googleSignUpRepo) : super(GoogleSignUpInitial());

  final GoogleSignUpRepo googleSignUpRepo;


  Future<void> signUpWithGoogle() async {
    _startLoading();
    Either<Failure, void> result = await _signUpWithGoogle();
    _handleStates(result);
  }

  Future<Either<Failure, void>> _signUpWithGoogle() async {
    final Either<Failure, void> result = await googleSignUpRepo.signUpWithGoogle();
    return result;
  }

  void _handleStates(Either<Failure, void> result) {
    result.fold(
      (failure) => emit(GoogleSignUpFailure(message: failure.message)),
      (success) => emit(GoogleSignUpSuccess()),
    );
  }

  void _startLoading() {
    emit(GoogleSignUpLoading());
  }
}
