import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_social_media_auth_service.dart';
import 'facebook_sign_up_repo.dart';

class FirebaseFacebookSignUpRepoImpl implements FacebookSignUpRepo {
  final FirebaseSocialMediaAuthService firebaseAuth;

  const FirebaseFacebookSignUpRepoImpl(this.firebaseAuth);
  @override
  Future<Either<Failure, void>> signInWithFacebook() async {
    try {
    await  firebaseAuth.authWithFacebook();
      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
