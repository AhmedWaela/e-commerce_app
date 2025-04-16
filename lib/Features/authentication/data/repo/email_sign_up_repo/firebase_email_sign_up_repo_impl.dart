import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_auth_service.dart';
import '../../models/user_model/user_model.dart';
import 'email_sign_up_repo.dart';

class FirebaseEmailSignUpRepoImpl implements EmailSignUpRepo {
  
  final FirebaseAuthService firebaseAuthService;

  const FirebaseEmailSignUpRepoImpl(this.firebaseAuthService);
  
  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword(UserModel user) async {
    return await _signUpWithEmailAndPassword(user);
  }

  Future<Either<Failure, void>> _signUpWithEmailAndPassword(UserModel user) async {
    try {
      return await _performSignUp(user);
    } catch (exception) {
      return _handleFailure(exception);
    }
  }

  Either<Failure, void> _handleFailure(Object exception) {
    if (exception is FirebaseAuthException) {
      return _handleFirebaseAuthFailure(exception);
    }
    return left(Failure(message: exception.toString()));
  }

  Either<Failure, void> _handleFirebaseAuthFailure(FirebaseAuthException e) {
    String message = createMessage(e);
    return left(Failure(message: message));
  }

  String createMessage(FirebaseAuthException e) {
    String message;
    switch (e.code) {
      case "email-already-in-use":
        message = "Email already in use";
      case "invalid-email":
        message = "Invalid email";
      case "operation-not-allowed":
        message = "Operation not allowed";
      case "weak-password":
        message = "Weak password";
      default:
        message = e.message ?? "An unknown error occurred";
    }
    return message;
  }

  Future<Either<Failure, void>> _performSignUp(UserModel user) async {
    await firebaseAuthService.createUserWithEmailAndPassword(user);
    return right(null);
  }
}
