import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_social_media_auth_service.dart';
import '../../../../../core/services/supabase_social_media_auth_service.dart';
import '../../../../../core/utils/backends.dart';
import 'firebase_google_sign_up_repo_impl.dart';
import 'supabase_google_sign_up_repo_impl.dart';

abstract class GoogleSignUpRepo 
{
  Future<Either<Failure,void>> signUpWithGoogle();
  factory GoogleSignUpRepo.getFactory(BackEnds way) {
    switch (way) {
      case BackEnds.firebase:
        return FirebaseGoogleSignUpRepoImpl(FirebaseSocialMediaAuthService(FirebaseAuth.instance));
      case BackEnds.supabase:
        return SupabaseGoogleSignUpRepoImpl(SupabaseSocialMediaAuthService(Supabase.instance.client.auth));
    }
  }
}
