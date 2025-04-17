import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/singleton_google_sign_in.dart';
import 'auth_service.dart';

class SupabaseSocialMediaAuthService implements SocialMediaAuthService {
  final GoTrueClient supabaseAuth;

  const SupabaseSocialMediaAuthService(this.supabaseAuth);
  
  @override
  Future<void> authWithGoogle() async {
    final SingletonGoogleSignIn signInManager = SingletonGoogleSignIn(serverClientId: "${dotenv.env["WEB_CLIENT_ID"]}");
    final GoogleSignIn  googleSignIn = signInManager.googleSignIn;
    final GoogleSignInAccount? signedInUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await signedInUser?.authentication;
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
      authScreenLaunchMode: LaunchMode.inAppWebView,
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



