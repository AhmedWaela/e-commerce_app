import '../../Features/authentication/data/models/user_model/user_model.dart';

abstract class EmailAndPasswordAuthService {
  const EmailAndPasswordAuthService();
  Future<void> createUserWithEmailAndPassword(UserModel user);
}