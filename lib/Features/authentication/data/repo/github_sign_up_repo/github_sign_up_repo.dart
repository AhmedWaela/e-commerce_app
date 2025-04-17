import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/authentication/data/repo/github_sign_up_repo/firebase_github_sign_up_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_social_media_auth_service.dart';
import '../../../../../core/services/supabase_social_media_auth_service.dart';
import '../../../../../core/utils/backends.dart';
import 'supabase_github_sign_up_repo_impl.dart';

abstract class GithubSignUpRepo {
  Future<Either<Failure, void>> signUpWithGithub(BuildContext context);
    factory GithubSignUpRepo.getFactory(BackEnds way) {
    switch (way) {
      case BackEnds.firebase:
        return FirebaseGithubSignUpRepoImpl(FirebaseSocialMediaAuthService(FirebaseAuth.instance));
      case BackEnds.supabase:
        return SupabaseGithubSignUpRepoImpl(SupabaseSocialMediaAuthService(Supabase.instance.client.auth));
    }
  }
}
