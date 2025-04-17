import 'package:supabase_flutter/supabase_flutter.dart';
import '../../Features/authentication/data/models/user_model/user_model.dart';
import 'email_and_password_auth_service.dart';

class SupabaseEmailAndPasswordAuthService implements EmailAndPasswordAuthService {
  final GoTrueClient supabaseAuth;

  const SupabaseEmailAndPasswordAuthService(this.supabaseAuth);

  @override
  Future<void> createUserWithEmailAndPassword(UserModel user) async {
    await supabaseAuth.signUp(email: user.email, password: user.password);
  }
}