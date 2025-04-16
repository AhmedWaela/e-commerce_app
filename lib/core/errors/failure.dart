class Failure {
  final String message;

  const Failure({required this.message});
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure({required super.message});

  factory FirebaseAuthFailure.fromEmailAuth(String code) {
    String message;
    switch (code) {
      case 'email-already-in-use':
        message = "This email is already registered. Please try logging in or use a different email to sign up.";
        break;
      case 'invalid-email':
        message = "The email you entered doesn't seem to be valid. Please check and try again.";
        break;
      case 'operation-not-allowed':
        message = "It seems this feature is temporarily unavailable. Please contact support or try again later.";
        break;
      case 'weak-password':
        message = "Your password is too weak. Please create a stronger password with at least 6 characters.";
        break;
      case 'too-many-requests':
        message = "We've noticed unusual activity. Please wait a moment and try again.";
        break;
      case 'user-token-expired':
        message = "Your session has expired. Please log in again to continue.";
        break;
      case 'network-request-failed':
        message = "We couldn't connect to the network. Please check your internet connection and try again.";
        break;
      default:
        message = "An unexpected error occurred. Please try again or contact support if the issue persists.";
    }
    return FirebaseAuthFailure(message: message);
  }
  

  

}
