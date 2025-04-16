import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/user_model/user_model.dart';
import '../../../data/repo/email_sign_up_repo/email_sign_up_repo.dart';
part 'email_sign_up_state.dart';

class EmailSignUpCubit extends Cubit<EmailSignUpState> {
  EmailSignUpCubit(this.emailSignUpRepo): super(SignUpInitial());

  final EmailSignUpRepo emailSignUpRepo;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

   bool get isValid => isDataValid;

   bool get isDataValid {
     return nameText.isNotEmpty &&
      emailText.isNotEmpty &&
      passwordText.isNotEmpty;
   }

   String get passwordText => password.text;

   String get emailText => email.text;

   String get nameText => name.text;

  Future<void> signUpWithEmailAndPassword() async {
    if (isDataValid) {
      await _performSignUp();
    } else {
      emit(SignUpFailure(message: "Please fill all fields"));
    }
  }

  Future<void> _performSignUp() async {
    _startLoading();
    UserModel user = _createUserModel();
    Either<Failure, void> result =
        await _startSignUpWithEmailAndPassword(user);
    _handleStates(result);
  }

  void _clearControllers() {
    if (name.text.isNotEmpty ||
        email.text.isNotEmpty ||
        password.text.isNotEmpty) {
      name.clear();
      email.clear();
      password.clear();
    }
  }

  UserModel _createUserModel() {
    UserModel user = UserModel(
      name: name.text,
      email: email.text,
      password: password.text,
    );
    return user;
  }

  void _startLoading() {
    emit(SignUpLoading());
  }

  Future<Either<Failure, void>> _startSignUpWithEmailAndPassword(
      UserModel user) async {
    Either<Failure, void> result =
        await emailSignUpRepo.signUpWithEmailAndPassword(user);
    return result;
  }

  void _handleStates(Either<Failure, void> result) {
    result.fold(
      (failure) {
        emit(SignUpFailure(message: failure.message));
      },
      (success) {
        _clearControllers();
        emit(SignUpSuccess());
      },
    );
  }
}
