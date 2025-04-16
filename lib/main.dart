import "package:flutter/material.dart" hide Theme;
import "package:flutter_dotenv/flutter_dotenv.dart";
import "core/utils/app_router.dart";
import "core/utils/app_starter.dart";
import "core/utils/firebase_initalizer.dart";
import "core/utils/flutter_binding_initalizer.dart";
import "core/utils/supabase_initializer.dart";
import "core/utils/theme.dart";

  Future<void> main() async {
    await initalizeAndStartApp();
  }

  Future<void> initalizeAndStartApp() async {
    FlutterBindingInitializer.initialize();
    await dotenv.load(fileName: ".env");
    await Future.wait([
      FirebaseInitializer.initialize(),
      SupabaseInitializer.initialize(),

    ]);
  AppStarter.start();
 }



class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: Theme.getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routers,
    );
  }
}
