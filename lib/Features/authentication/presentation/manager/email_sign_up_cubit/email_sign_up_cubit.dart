import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/user_model/user_model.dart';
import '../../../data/repo/email_sign_up_repo/email_sign_up_repo.dart';
part 'email_sign_up_state.dart';

class EmailSignUpCubit extends Cubit<EmailSignUpState> {
  EmailSignUpCubit(this.emailSignUpRepo) : super(SignUpInitial());

  final EmailSignUpRepo emailSignUpRepo;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> signUpWithEmailAndPassword() async {
    try {
      if (isDataEmpty) {
        _askForFillData();
      }
      if (isNameShort) {
        _askForIncreaseName();
      }else{
       await _performSignUp();
      }
    } catch (e) {
      emit(SignUpFailure(message: e.toString()));
    }
  }

  void _askForIncreaseName() {
    throw Exception("name length must 6 characte at leasest");
  }

  void _askForFillData() {
          throw Exception("please fill all fields ");
  }

  bool get isNameShort => name.text.length < 6;

  bool get isDataEmpty => name.text.isEmpty && email.text.isEmpty && password.text.isEmpty;

  Future<void> _performSignUp() async {
    _startLoading();
    UserModel user = _createUserModel();
    Either<Failure, void> result = await _startSignUpWithEmailAndPassword(user);
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
