import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../Features/authentication/data/models/user_model/user_model.dart';
import '../utils/singleton_google_sign_in.dart';
import 'auth_service.dart';

class SupabaseAuthService implements AuthService {
  final GoTrueClient supabaseAuth;

  const SupabaseAuthService(this.supabaseAuth);

  @override
  Future<void> createUserWithEmailAndPassword(UserModel user) async {
    await supabaseAuth.signUp(email: user.email, password: user.password);
  }

  @override
  Future<void> authWithGoogle() async {
    final SingletonGoogleSignIn singletonGoogleSignIn = SingletonGoogleSignIn(serverClientId: "${dotenv.env["WEB_CLIENT_ID"]}");
    final GoogleSignInAccount? googleUser =
        await singletonGoogleSignIn.googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final String? accessToken = googleAuth?.accessToken;
    final String? idToken = googleAuth?.idToken;
    await supabaseAuth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken ?? "",
      accessToken: accessToken,
    );
  }

  @override
  Future<void> authWithFacebook() async {
    await supabaseAuth.signInWithOAuth(
      OAuthProvider.facebook,
    );
  }

  @override
  Future<void> authWithGithub(BuildContext context) async {
    await supabaseAuth.signInWithOAuth(
      OAuthProvider.github,
      authScreenLaunchMode: LaunchMode.inAppWebView,
    );
  }
}
