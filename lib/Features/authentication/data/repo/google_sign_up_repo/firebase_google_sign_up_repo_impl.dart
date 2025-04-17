import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_social_media_auth_service.dart';
import 'google_sign_up_repo.dart';

class FirebaseGoogleSignUpRepoImpl implements GoogleSignUpRepo {
  final FirebaseSocialMediaAuthService authService;

  const FirebaseGoogleSignUpRepoImpl(this.authService);

  @override
  Future<Either<Failure, void>> signUpWithGoogle() async {
    try {
      await authService.authWithGoogle();
      return right(null);
    } catch (exception) {
      return left(Failure(message: exception.toString()));
    }
  }
}
