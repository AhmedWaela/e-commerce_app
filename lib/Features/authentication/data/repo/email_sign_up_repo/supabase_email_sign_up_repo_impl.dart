import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/supabase_auth_service.dart';
import '../../models/user_model/user_model.dart';
import 'email_sign_up_repo.dart';

class SupabaseEmailSignUpRepoImpl implements EmailSignUpRepo 
{

  final SupabaseAuthService supabaseAuthService;

  const SupabaseEmailSignUpRepoImpl(this.supabaseAuthService);

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword(
      UserModel user) async {
    return await _signUpWithEmailAndPassword(user);
  }

  Future<Either<Failure, void>> _signUpWithEmailAndPassword(UserModel user) async {
      try {
      return await _performSignUp(user);
    } catch (exception) {
      return _handleFailures(exception);
    }
  }

  Either<Failure, void> _handleFailures(Object exception) {
    if (exception is AuthException) {
      return left(Failure(message: exception.message));
    }
    return left(Failure(message: exception.toString()));
  }

  Future<Either<Failure, void>> _performSignUp(UserModel user) async {
    await supabaseAuthService.createUserWithEmailAndPassword(user);
    return right(null);
  }

}
