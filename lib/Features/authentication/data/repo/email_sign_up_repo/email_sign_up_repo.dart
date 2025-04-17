import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/firebase_email_and_password_auth_service.dart';
import '../../../../../core/services/supabase_email_and_password_auth_service.dart';
import '../../../../../core/utils/backends.dart';
import '../../models/user_model/user_model.dart';
import 'firebase_email_sign_up_repo_impl.dart';
import 'supabase_email_sign_up_repo_impl.dart';

abstract class EmailSignUpRepo {
  Future<Either<Failure, void>> signUpWithEmailAndPassword(UserModel user);

  factory EmailSignUpRepo.getFactory(BackEnds way) {
    switch (way) {
      case  BackEnds.firebase:
        return FirebaseEmailSignUpRepoImpl(FirebaseEmailAndPasswordAuthService(FirebaseAuth.instance));
      case BackEnds.supabase:
        return SupabaseEmailSignUpRepoImpl(SupabaseEmailAndPasswordAuthService(Supabase.instance.client.auth));
    }
  }
}

