import 'package:google_sign_in/google_sign_in.dart';

class SingletonGoogleSignIn {
  late GoogleSignIn googleSignIn;
  bool _isInitialized = false;
  static final SingletonGoogleSignIn _instance = SingletonGoogleSignIn._internal();

  SingletonGoogleSignIn._internal();

  factory SingletonGoogleSignIn({String? serverClientId}) {
    if (!_instance._isInitialized) {
      _instance.googleSignIn = GoogleSignIn(serverClientId: serverClientId);
      _instance._isInitialized = true;
    }
    return _instance;
  }
}
