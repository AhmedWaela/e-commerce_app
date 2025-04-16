import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_auth_service.dart';
import '../../../../../core/services/supabase_auth_service.dart';
import '../../../../../core/utils/backends.dart';
import 'firebase_google_sign_up_repo_impl.dart';
import 'supabase_google_sign_up_repo_impl.dart';

abstract class GoogleSignUpRepo 
{
  Future<Either<Failure,void>> signUpWithGoogle();
  factory GoogleSignUpRepo.getFactory(BackEnds way) {
    switch (way) {
      case BackEnds.firebase:
        return FirebaseGoogleSignUpRepoImpl(FirebaseAuthService(FirebaseAuth.instance));
      case BackEnds.supabase:
        return SupabaseGoogleSignUpRepoImpl(SupabaseAuthService(Supabase.instance.client.auth));
    }
  }
}
