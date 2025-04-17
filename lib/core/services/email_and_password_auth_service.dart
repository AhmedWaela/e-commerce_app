import '../../Features/authentication/data/models/user_model/user_model.dart';

abstract class EmailAuthService {
  const EmailAuthService();

  /// Registers a new user with the provided [UserModel] details using the backend authentication service.
  /// 
  /// This method creates a user account with the given [user.email] and [user.password]. 
  /// It delegates the actual account creation process to the underlying backend authentication service.
  ///
  /// Example usage:
  /// ```dart
  /// final SupabaseEmailAuthService emailAuthService = 
  ///     SupabaseEmailAuthService(Supabase.instance.auth);
  ///
  /// final UserModel user = UserModel(
  ///   email: "ahmedwael99104@gmail.com",
  ///   password: "123456789",
  /// );
  ///
  /// await emailAuthService.createUserWithEmailAndPassword(user);
  /// ```
  ///
  /// Throws an [Exception] if the registration fails or if invalid details are provided.
  Future<void> createUserWithEmailAndPassword(UserModel user);
}
