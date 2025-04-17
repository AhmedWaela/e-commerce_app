import 'package:flutter/material.dart';

abstract class SocialMediaAuthService {
  const SocialMediaAuthService();
  Future<void> authWithGoogle();
  Future<void> authWithFacebook();
  Future<void> authWithGithub(BuildContext context);
}


