import 'package:firebase_auth/firebase_auth.dart';
import '../../Features/authentication/data/models/user_model/user_model.dart';
import 'email_and_password_auth_service.dart';

class FirebaseEmailAndPasswordAuthService implements EmailAuthService {
  final FirebaseAuth firebaseAuth;

  const FirebaseEmailAndPasswordAuthService(this.firebaseAuth);

  @override
  Future<void> createUserWithEmailAndPassword(UserModel user) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }
}