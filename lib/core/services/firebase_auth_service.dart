import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:github_oauth/github_oauth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Features/authentication/data/models/user_model/user_model.dart';
import '../utils/singleton_google_sign_in.dart';
import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth firebaseAuth;

  const FirebaseAuthService(this.firebaseAuth);

  @override
  Future<void> createUserWithEmailAndPassword(UserModel user) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<void> authWithGoogle() async {
    final SingletonGoogleSignIn singletonGoogleSignIn = SingletonGoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await singletonGoogleSignIn.googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final OAuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
    await firebaseAuth.signInWithCredential(authCredential);
  }

  @override
  Future<void> authWithFacebook() async {
    final result = await FacebookAuth.instance.login();
    final credential =
        FacebookAuthProvider.credential(result.accessToken?.tokenString ?? "");
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> authWithGithub(BuildContext context) async {
    final GitHubSignIn  githubSignin = GitHubSignIn(
      clientId: '${dotenv.env["GITHUB_CLIENT_ID"]}',
      clientSecret: '${dotenv.env["GITHUB_CLIENT_SECRET"]}',
      redirectUrl: '${dotenv.env["GITHUB_REDIRECT_URI"]}',
    );
    final GitHubSignInResult gitHubSignInResult = await githubSignin.signIn(context);
    final OAuthCredential credential = GithubAuthProvider.credential(gitHubSignInResult.token ?? "");
    await firebaseAuth.signInWithCredential(credential);
  }
}
