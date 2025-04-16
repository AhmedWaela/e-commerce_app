import 'package:google_sign_in/google_sign_in.dart';

class SingletonGoogleSignIn {
  late GoogleSignIn googleSignIn;
  static final SingletonGoogleSignIn _instance = SingletonGoogleSignIn._internal();

  SingletonGoogleSignIn._internal();

  factory SingletonGoogleSignIn({String? serverClientId}) {
      _instance.googleSignIn = GoogleSignIn(serverClientId: serverClientId);
    return _instance;
  }
}
