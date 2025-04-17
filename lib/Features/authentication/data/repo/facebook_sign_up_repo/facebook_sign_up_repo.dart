import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/services/firebase_social_media_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/services/supabase_social_media_auth_service.dart';
import '../../../../../core/utils/backends.dart';
import 'firebase_facebook_sign_up_repo_impl.dart';
import 'supabase_facebook_sign_up_repo_impl.dart';

abstract class FacebookSignUpRepo 
{
  Future<Either<Failure, void>> signInWithFacebook();

  factory FacebookSignUpRepo.getFactory(BackEnds way) {
    switch (way) {
      case BackEnds.firebase:
        return FirebaseFacebookSignUpRepoImpl(
          FirebaseSocialMediaAuthService(FirebaseAuth.instance),
        );
      case BackEnds.supabase:
        return SupabaseFacebookSignUpRepoImpl(
          SupabaseSocialMediaAuthService(Supabase.instance.client.auth),
        );
    }
  }
}


