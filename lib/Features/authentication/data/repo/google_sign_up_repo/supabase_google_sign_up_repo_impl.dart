import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/supabase_auth_service.dart';
import 'google_sign_up_repo.dart';

class SupabaseGoogleSignUpRepoImpl implements GoogleSignUpRepo {
  final SupabaseAuthService supabaseAuthService;

  const SupabaseGoogleSignUpRepoImpl(this.supabaseAuthService);

  @override
  Future<Either<Failure, void>> signUpWithGoogle() async {
    try {
      await supabaseAuthService.authWithGoogle();
      return right(null);
    } catch (exception) {
      return left(Failure(message: exception.toString()));
    }
  }
}
