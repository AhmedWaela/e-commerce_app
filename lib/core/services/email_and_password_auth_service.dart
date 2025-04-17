import '../../Features/authentication/data/models/user_model/user_model.dart';

abstract class EmailAuthService {
  const EmailAuthService();
  Future<void> createUserWithEmailAndPassword(UserModel user);
}