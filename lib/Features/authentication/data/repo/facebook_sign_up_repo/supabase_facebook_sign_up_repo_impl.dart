import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/supabase_auth_service.dart';
import 'facebook_sign_up_repo.dart';

class SupabaseFacebookSignUpRepoImpl implements FacebookSignUpRepo {
  final SupabaseAuthService supabaseAuthService;

  const SupabaseFacebookSignUpRepoImpl(this.supabaseAuthService);
  @override
  Future<Either<Failure, void>> signInWithFacebook() async {
    try {
    await  supabaseAuthService.authWithFacebook();
      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
