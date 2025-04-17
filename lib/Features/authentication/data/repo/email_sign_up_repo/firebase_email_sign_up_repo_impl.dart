import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_email_and_password_auth_service.dart';
import '../../models/user_model/user_model.dart';
import 'email_sign_up_repo.dart';

class FirebaseEmailSignUpRepoImpl implements EmailSignUpRepo {
  final FirebaseEmailAndPasswordAuthService firebaseAuthService;

  const FirebaseEmailSignUpRepoImpl(this.firebaseAuthService);

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword(
      UserModel user) async {
    return await _signUpWithEmailAndPassword(user);
  }

  Future<Either<Failure, void>> _signUpWithEmailAndPassword(
      UserModel user) async {
    try {
      return await _performSignUp(user);
    } catch (exception) {
      if (exception is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromEmailAuth(exception.code));
      }
      return _handleFailure(exception);
    }
  }

  Either<Failure, void> _handleFailure(Object exception) {
    return left(Failure(message: exception.toString()));
  }

  Future<Either<Failure, void>> _performSignUp(UserModel user) async {
    await firebaseAuthService.createUserWithEmailAndPassword(user);
    return right(null);
  }
}
