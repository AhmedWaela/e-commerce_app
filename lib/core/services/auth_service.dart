import 'package:flutter/material.dart';
import '../../Features/authentication/data/models/user_model/user_model.dart';

abstract class AuthService {
  Future<void> createUserWithEmailAndPassword(UserModel user);
  Future<void> authWithGoogle();
  Future<void> authWithFacebook();
  Future<void> authWithGithub(BuildContext context);
}
