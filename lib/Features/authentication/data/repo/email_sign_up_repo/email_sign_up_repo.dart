import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_auth_service.dart';
import '../../../../../core/services/supabase_auth_service.dart';
import '../../../../../core/utils/backends.dart';
import '../../models/user_model/user_model.dart';
import 'firebase_email_sign_up_repo_impl.dart';
import 'supabase_email_sign_up_repo_impl.dart';

abstract class EmailSignUpRepo {
  Future<Either<Failure, void>> signUpWithEmailAndPassword(UserModel user);

  factory EmailSignUpRepo.getFactory(BackEnds way) {
    switch (way) {
      case  BackEnds.firebase:
        return FirebaseEmailSignUpRepoImpl(FirebaseAuthService(FirebaseAuth.instance));
      case BackEnds.supabase:
        return SupabaseEmailSignUpRepoImpl(SupabaseAuthService(Supabase.instance.client.auth));
    }
  }
}

